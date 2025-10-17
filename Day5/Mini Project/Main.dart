import 'package:flutter/material.dart';
import 'home.dart';
import 'add_book.dart';
import 'info.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/add': (context) => AddBookPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}
