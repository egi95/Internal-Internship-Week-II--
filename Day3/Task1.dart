
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showGreeting = true;
  int _counter = 0;

  void _toggleText() {
    setState(() {
      _showGreeting = !_showGreeting;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Teksti u ndryshua!')),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Numëruesi u rrit në $_counter')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Web me setState()')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _showGreeting ? 'Përshëndetje' : 'U përditësua!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Numëruesi: $_counter', style: TextStyle(fontSize: 20)),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _toggleText,
              child: Text('Ndërro tekstin'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Rrit numëruesin'),
            ),
          ],
        ),
      ),
    );
  }
}
