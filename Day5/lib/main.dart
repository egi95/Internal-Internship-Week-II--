import 'package:flutter/material.dart';
import 'home.dart';
import 'add_page.dart';
import 'info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Project Day 5',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}
