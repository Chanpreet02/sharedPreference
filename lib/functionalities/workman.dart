/*

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

void backgroundTask() async {
  final url = 'https://jsonplaceholder.typicode.com/posts/1';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String responseData = response.body;
    prefs.setString('api_data', responseData);
    print('API data saved to SharedPreferences.');
  } else {
    print('Failed to load API data');
  }
}



class workBack extends StatefulWidget {
  const workBack({super.key});

  @override
  State<workBack> createState() => _workBackState();
}

class _workBackState extends State<workBack> {
  String _storedData = "No data available";
  static const taskName = 'first';
  @override
  void initState() {
    super.initState();
    Workmanager().initialize(callbackDispatcher);
  }

  void sendDaya(){
    print("background");

  }

  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) {
      // backgroundTask();
      switch(taskName){
        case 'first':
          sendDaya();
          break;
        default:
      }
      return Future.value(true);
    });
  }

  void _startBackgroundTask() {
    Workmanager().registerPeriodicTask(
      'id_unique',  // Task ID
      'simpleTask',  // Task name
      frequency: const Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }

  // Method to load data from SharedPreferences
  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedData = prefs.getString('api_data') ?? "No data available";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkManager Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _startBackgroundTask();  // Start the background task when pressed
                },
                child: const Text("Start WorkManager"),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Stored Data:',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _storedData == "No data available"
                ? const CircularProgressIndicator()  // Show a loading spinner if no data yet
                : Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Title: ${jsonDecode(_storedData)['title']}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Body: ${jsonDecode(_storedData)['body']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// WorkManager callback dispatcher that runs when a background task is triggered
void callbackDispatcher() async {
  Workmanager().executeTask((task, inputData) async {
    // Print to the terminal (console) every time the task is triggered
    print('Task executed at ${DateTime.now()}');

    // Fetch the data from the API
    try {
      var data = await fetchData();
      storeDataInSharedPreferences(data); // Store fetched data in SharedPreferences

      // Update the last_message in SharedPreferences
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('last_message', 'Task executed at ${DateTime.now()}');
      print('Data fetched and stored in SharedPreferences');
    } catch (e) {
      print('Failed to fetch data: $e');
    }

    return Future.value(true);  // Return success
  });
}

// Function to initialize WorkManager and schedule periodic tasks
void initializeWorkManager() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);  // Initialize WorkManager
  _schedulePeriodicTask();  // Schedule a task to run every 15 minutes
}

// Function to schedule a periodic task to run every 15 minutes
void _schedulePeriodicTask() {
  Workmanager().registerPeriodicTask(
    "fetch_api_data_task", // Task name
    "fetch_api_data_task_id", // Task ID (unique identifier)
    frequency: const Duration(minutes: 15), // Task frequency
  );
}

// Function to fetch data from the API
Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    return json.decode(response.body); // Decode the JSON response into a Map
  } else {
    throw Exception('Failed to load data');
  }
}

// Function to store data in SharedPreferences
void storeDataInSharedPreferences(Map<String, dynamic> data) async {
  final prefs = await SharedPreferences.getInstance();
  // Convert the map to a JSON string
  String jsonData = json.encode(data);
  await prefs.setString('api_data', jsonData);  // Store it in SharedPreferences
}

// Function to retrieve the stored data from SharedPreferences
Future<Map<String, dynamic>?> retrieveDataFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonData = prefs.getString('api_data');

  if (jsonData != null) {
    // Convert the JSON string back into a Map
    return json.decode(jsonData);
  }
  return null;  // Return null if no data is found
}

// Function to load the last message from SharedPreferences
Future<String> loadLastMessage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('last_message') ?? "Waiting for the task...";
}

// Function to create the UI for the background task screen
class workBack extends StatefulWidget {
  const workBack({super.key});

  @override
  _workBackState createState() => _workBackState();
}

class _workBackState extends State<workBack> {
  String message = "Waiting for the task..."; // Initial message before task is triggered
  late Future<Map<String, dynamic>?> postData;

  @override
  void initState() {
    super.initState();
    postData = retrieveDataFromSharedPreferences();  // Load data from SharedPreferences
    _loadLastMessage();  // Load the last message from SharedPreferences
  }

  // Load the last message from SharedPreferences and update the UI
  void _loadLastMessage() async {
    var lastMessage = await loadLastMessage();
    setState(() {
      message = lastMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkManager Example'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>?>(
          future: postData,  // Get the stored API data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'User ID: ${data['userId']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Post ID: ${data['id']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Title: ${data['title']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Body: ${data['body']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    message,  // Display the message on the screen from SharedPreferences
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              );
            } else {
              return const Text('No data found');
            }
          },
        ),
      ),
    );
  }
}
