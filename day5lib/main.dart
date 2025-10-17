import 'package:flutter/material.dart';
import 'home.dart';
import 'add_item.dart';
import 'info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline App Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => AddItemScreen(),
        '/info': (context) => InfoScreen(),
      },
    );
  }
}
