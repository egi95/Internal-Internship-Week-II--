import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isGreeting = true;
  int _counter = 0;

  void _onPressed() {
    setState(() {
      _isGreeting = !_isGreeting;
      _counter++;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Veprim i kryer! $_counter')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Web')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isGreeting ? 'Përshëndetje' : 'U përditësua!'),
            Text('Counter: $_counter'),
            ElevatedButton(
              onPressed: _onPressed,
              child: Text('Kliko'),
            ),
          ],
        ),
      ),
    );
  }
}
