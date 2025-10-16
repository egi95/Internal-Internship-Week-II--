import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
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
  String text = "Përshëndetje";
  int counter = 0;

  void _changeText() {
    setState(() {
      // mund të përdorësh ose ndërrim teksti ose counter
      if (text == "Përshëndetje") {
        text = "U përditësua!";
      } else {
        text = "Përshëndetje";
      }

      counter++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('UI u përditësua! Numëruesi: $counter'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Flutter Web')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$text ($counter)',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: const Text('Kliko për përditësim'),
            ),
          ],
        ),
      ),
    );
  }
}
