import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Book List",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text("This app demonstrates navigation, setState, "
                "and simple data management using an in-memory list."),
            SizedBox(height: 20),
            Text("Created by: Ermal Beka"),
            Text("Course: CodeInvention Internal Internship"),
            SizedBox(height: 10),
            Text("Version: 1.0.0"),
          ],
        ),
      ),
    );
  }
}
