import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task 1',
      home: TextChangerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TextChangerScreen extends StatefulWidget {
  @override
  State<TextChangerScreen> createState() => _TextChangerScreenState();
}

class _TextChangerScreenState extends State<TextChangerScreen> {
  String message = "Përshëndetje";

  void changeText() {
    setState(() {
      // Ndryshon tekstin me klikim
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
        title: Text('Task 1 - Flutter Internship'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeText,
              child: Text('Ndrysho Tekstin'),
            ),
          ],
        ),
      ),
    );
  }
}
