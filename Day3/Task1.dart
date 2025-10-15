import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ndrysho Tekstin',
      home: ChangeTextScreen(),
    );
  }
}


class ChangeTextScreen extends StatefulWidget {
  @override
  _ChangeTextScreenState createState() => _ChangeTextScreenState();
}

class _ChangeTextScreenState extends State<ChangeTextScreen> {
  String message = "Përshëndetje"; 

  void _changeText() {
    setState(() {
      // Ndryshon tekstin
      if (message == "Përshëndetje") {
        message = "U përditësua!";
      } else {
        message = "Përshëndetje";
      }
    });

    
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
        title: Text('Task 1 – Ndrysho Tekstin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: Text('Ndrysho Tekstin'),
            ),
          ],
        ),
      ),
    );
  }
}

