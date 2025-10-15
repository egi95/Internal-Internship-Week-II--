import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 1 – Ndërrimi i Tekstit',
      home: TextChangePage(),
    );
  }
}

class TextChangePage extends StatefulWidget {
  @override
  _TextChangePageState createState() => _TextChangePageState();
}

class _TextChangePageState extends State<TextChangePage> {
  String message = "Përshëndetje";

  void _changeText() {
    setState(() {
      message = (message == "Përshëndetje") ? "U përditësua!" : "Përshëndetje";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Teksti u ndryshua!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ndrysho Tekstin"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
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
