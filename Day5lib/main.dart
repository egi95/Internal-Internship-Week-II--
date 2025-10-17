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
      title: 'Offline Mini Project',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}
