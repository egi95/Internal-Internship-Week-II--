import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayText = 'Përshëndetje';
  int counter = 0;

  void _updateText() {
    setState(() {
      // Ndryshon tekstin
      if (displayText == 'Përshëndetje') {
        displayText = 'U përditësua!';
      } else {
        displayText = 'Përshëndetj
