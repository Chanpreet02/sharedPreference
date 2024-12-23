/*

import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String title;
  final String content;

  CustomWidget({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(content),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class MyCustomWidget extends StatelessWidget {
  final String title;
  final String content;

  MyCustomWidget({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(content),
          ],
        ),
      ),
    );
  }
}
