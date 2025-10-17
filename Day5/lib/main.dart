import 'package:flutter/material.dart';
import 'home.dart';
import 'add_page.dart';
import 'info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> items = ["Flutter", "Dart", "Firebase"];

  void addItem(String newItem) {
    setState(() {
      items.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Project',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(items: items, onAddPressed: addItem),
      routes: {
        '/add': (context) => AddPage(onAddItem: addItem),
        '/info': (context) => InfoPage(),
      },
    );
  }
}
