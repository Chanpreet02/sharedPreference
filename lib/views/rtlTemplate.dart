import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:response/functionalities/apimodel.dart';
import 'package:response/functionalities/fetch_data.dart';

/*
class RTLTemplate extends StatefulWidget {
  final ApiModel apiModel;
  final Widget widget;

  RTLTemplate({required this.apiModel, required this.widget});

  @override
  State<RTLTemplate> createState() => _RTLTemplateState();
}

class _RTLTemplateState extends State<RTLTemplate> {
  dataFetch calling = dataFetch();
  late Future<Map<String, dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = calling.fetchData(widget.apiModel.apiEndpoint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.apiModel.name),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: _data,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            } else if(snapshot.hasError){
              return Center(child: Text("${snapshot.error}"),);
            } else if(snapshot.hasData){
              final data = snapshot.data!;
              return widget.widget;
            } else{
              return Text("No data available");
            }
          }
      ),
    );
  }
}

*/

class RTLTemplate extends StatefulWidget {
  final ApiModel apiModel;
  final Widget widget;

  RTLTemplate({required this.apiModel, required this.widget});

  @override
  _RTLTemplateState createState() => _RTLTemplateState();
}

class _RTLTemplateState extends State<RTLTemplate> {
  late Future<List<dynamic>> _data;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _data = fetchData(_currentPage);
  }

  Future<List<dynamic>> fetchData(int page) async {
    final response = await http.get(Uri.parse('${widget.apiModel.apiEndpoint}?_page=$page&_limit=10'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.apiModel.name),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final post = data[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User ID: ${post['userId'] ?? 'No User ID'}',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'ID: ${post['id'] ?? 'No ID'}',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Title: ${post['title'] ?? 'No Title'}',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Body: ${post['body'] ?? 'No Body'}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _currentPage > 1
                            ? () {
                          setState(() {
                            _currentPage--;
                            _data = fetchData(_currentPage); // Load previous page
                          });
                        }
                            : null,
                        child: Text('Previous'),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentPage++;
                            _data = fetchData(_currentPage); // Load next page
                          });
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
