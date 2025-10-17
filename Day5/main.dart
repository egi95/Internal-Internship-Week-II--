import 'package:flutter/material.dart';
import 'home.dart';
import 'info.dart';

void main() {
  runApp(const MyApp());
}

class Item {
  int id;
  String title;
  String description;

  Item({required this.id, required this.title, required this.description});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 5 Mini Project',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
