import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 1 – Buton që ndryshon tekstin',
      debugShowCheckedModeBanner: false,
      home: TextChangeScreen(),
    );
  }
}

class TextChangeScreen extends StatefulWidget {
  @override
  _TextChangeScreenState createState() => _TextChangeScreenState();
}

class _TextChangeScreenState extends State<TextChangeScreen> {
  String _text = "Përshëndetje";

  void _changeText() {
    setState(() {
      if (_text == "Përshëndetje") {
        _text = "U përditësua!";
      } else {
        _text = "Përshëndetje";
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Teksti u ndryshua!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 1 – Ndrysho tekstin"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _text,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: Text("Ndrysho Tekstin"),
            ),
          ],
        ),
      ),
    );
  }
}
