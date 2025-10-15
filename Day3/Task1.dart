import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Day3 Task1',
      home: Task1HomePage(),
    );
  }
}

class Task1HomePage extends StatefulWidget {
  @override
  _Task1HomePageState createState() => _Task1HomePageState();
}

class _Task1HomePageState extends State<Task1HomePage> {
  String buttonText = "Përshëndetje"; // Teksti fillestar
  int counter = 0; // Numëruesi

  void _updateText() {
    setState(() {
      // Ndryshimi i tekstit ose rritja e counter-it
      if (buttonText == "Përshëndetje") {
        buttonText = "U përditësua!";
      } else {
        buttonText = "Përshëndetje";
      }
      counter++;
    });

    // Shfaqja e SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Veprimi u krye! Numri i klikimeve: $counter"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1 – Buton që ndryshon tekstin'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _updateText,
          child: Text(buttonText),
        ),
      ),
    );
  }
}
