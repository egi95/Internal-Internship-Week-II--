import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Day3 - Task 1',
      home: ChangeTextPage(),
    );
  }
}

class ChangeTextPage extends StatefulWidget {
  @override
  _ChangeTextPageState createState() => _ChangeTextPageState();
}

class _ChangeTextPageState extends State<ChangeTextPage> {
  String message = "Përshëndetje";

  void _changeText() {
    setState(() {
      // Ndërron tekstin
      if (message == "Përshëndetje") {
        message = "U përditësua!";
      } else {
        message = "Përshëndetje";
      }
    });

    // Shfaq SnackBar pas përditësimit
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Teksti u përditësua!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 1 – Ndryshimi i Tekstit"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: _changeText,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: Text(
                'Ndrysho Tekstin',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

