import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundManager extends StatefulWidget {
  const BackgroundManager({super.key});

  @override
  State<BackgroundManager> createState() => _BackgroundManagerState();
}

class _BackgroundManagerState extends State<BackgroundManager> {
  String _storedData = "No data stored";
  TextEditingController _controller = TextEditingController(); // Controller for the TextField

  // Load the stored data from SharedPreferences
  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedData = prefs.getString('stored_data') ?? "No data found";
    });
  }

  // Save the entered data to SharedPreferences
  void _saveData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stored_data', data);  // Save data to SharedPreferences
    _loadData();  // Reload the data after saving
  }

  @override
  void initState() {
    super.initState();
    _loadData();  // Load data when the widget is first built
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stored Data: $_storedData',  // Display the stored data
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,  // Assign the controller to capture the text
              decoration: const InputDecoration(
                labelText: 'Enter data to save',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String inputData = _controller.text;  // Get the text from the TextField
                if (inputData.isNotEmpty) {
                  _saveData(inputData);  // Save the text entered in the TextField
                }
              },
              child: const Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}
