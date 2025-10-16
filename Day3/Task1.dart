import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 3 - Task 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _teksti = "Përshëndetje";
  int _counter = 0;

  void _ndryshoTekstin() {
    setState(() {
      if (_teksti == "Përshëndetje") {
        _teksti = "U përditësua!";
      } else {
        _teksti = "Përshëndetje";
      }
      _counter++;
    });
    
    // Shfaq SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Butoni u klikua! Numëruesi: $_counter'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1 - Ndryshimi i Tekstit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _teksti,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Numëruesi: $_counter',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _ndryshoTekstin,
              child: Text('Kliko këtu'),
            ),
          ],
        ),
      ),
    );
  }
}
