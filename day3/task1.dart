import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 1 - Buton që ndryshon tekstin',
      home: TextChangePage(),
    );
  }
}

class TextChangePage extends StatefulWidget {
  @override
  State<TextChangePage> createState() => _TextChangePageState();
}

class _TextChangePageState extends State<TextChangePage> {
  String _text = "Përshëndetje"; // Teksti fillestar
  bool _isUpdated = false;       // Gjendja për ndërrimin e tekstit

  void _changeText() {
    setState(() {
      _isUpdated = !_isUpdated;
      _text = _isUpdated ? "U përditësua!" : "Përshëndetje";
    });

    // Shfaq SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Teksti u ndryshua me sukses!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1 - Flutter Web'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _text,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: Text('Ndrysho tekstin'),
            ),
          ],
        ),
      ),
    );
  }
}
