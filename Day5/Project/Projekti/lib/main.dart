import 'package:flutter/material.dart';
import 'home.dart';
import 'detail.dart';
import 'info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detail': (context) => DetailPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}
