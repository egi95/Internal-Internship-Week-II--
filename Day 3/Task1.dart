import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String text = "Përshëndetje";
  int counter = 0;

  void _action() {
    setState(() {
      if (text == "Përshëndetje") {
        text = "U përditësua!";
      } else {
        text = "Përshëndetje";
      }
      counter++;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Veprimi u krye! Counter: $counter'),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Web Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text, style: TextStyle(fontSize: 24)),
            Text('Counter: $counter', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _action,
              child: Text('Kliko për veprim'),
            ),
          ],
        ),
      ),
    );
  }
}
