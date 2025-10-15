import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Button Task',
      home: TextChangerApp(),
    );
  }
}

class TextChangerApp extends StatefulWidget {
  @override
  State<TextChangerApp> createState() => _TextChangerAppState();
}

class _TextChangerAppState extends State<TextChangerApp> {
  String message = "Përshëndetje";
  int counter = 0;

  void changeText() {
    setState(() {
      if (message == "Përshëndetje") {
        message = "U përditësua!";
      } else {
        message = "Përshëndetje";
      }
      counter++;
    });

    // Shfaq SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Veprimi u krye! Numëruesi: $counter"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task 1 – Buton që ndryshon tekstin")),
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
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text("Kliko për të ndryshuar", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Text(
              "Klikime: $counter",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
