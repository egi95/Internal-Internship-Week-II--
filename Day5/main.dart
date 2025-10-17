
import 'package:flutter/material.dart';
import 'home.dart';
import 'detail.dart';
import 'info.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Mini Project',
    home: HomePage(),
    routes: {
      '/info': (context) => InfoPage(),
    },
  ));
}
