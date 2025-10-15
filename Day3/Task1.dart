import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 1 Flutter Web',
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
  // Teksti që do të ndryshojë
  String displayText = 'Përshëndetje';

  // Numriues opsional
  int counter = 0;

  void _changeText() {
    setState(() {
      // Ndryshon tekstin nga Përshëndetje në U përditësua! ose anasjelltas
      if (displayText == 'Përshëndetje') {
        displayText = 'U përditësua!';
      } else {
        displayText = 'Përshëndetje';
      }

      // Rrit counter
      counter++;
    });

    // Tregon SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Veprimi u krye! Counter = $counter'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1 – Buton që ndryshon tekstin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayText,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: const Text('Kliko për të ndryshuar tekstin'),
            ),
          ],
        ),
      ),
    );
  }
}
