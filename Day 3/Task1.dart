// File: main.dart  (ose Day3/task1.dart)

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 1 – Buton që ndryshon tekstin',
      debugShowCheckedModeBanner: false,
      home: TextChangeScreen(),
    );
  }
}

class TextChangeScreen extends StatefulWidget {
  @override
  _TextChangeScreenState createState() => _TextChangeScreenState();
}

class _TextChangeScreenState extends State<TextChangeScreen> {
  String message = "Përshëndetje";

  void changeText() {
    setState(() {
      if (message == "Përshëndetje") {
        message = "U përditësua!";
      } else {
        message = "Përshëndetje";
      }
    });

    // Shfaqim SnackBar pas përditësimit
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Teksti u përditësua!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Task 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeText,
              child: Text("Ndrysho tekstin"),
            ),
          ],
        ),
      ),
    );
  }
}
