import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 1 - Buton Tekst/Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String displayText = "Përshëndetje";
  int counter = 0;

  void _toggleTextOrIncrement() {
    setState(() {
      // Ndryshon tekstin
      if (displayText == "Përshëndetje") {
        displayText = "U përditësua!";
      } else {
        displayText = "Përshëndetje";
      }

      counter++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Veprimi u krye! Counter: $counter'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1 - Buton Tekst/Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayText,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Counter: $counter',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _toggleTextOrIncrement,
              child: const Text('Kliko për të ndryshuar'),
            ),
          ],
        ),
      ),
    );
  }
}
