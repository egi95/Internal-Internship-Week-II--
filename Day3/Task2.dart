import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Task1Page(),
    );
  }
}

class Task1Page extends StatefulWidget {
  const Task1Page({super.key});

  @override
  State<Task1Page> createState() => _Task1PageState();
}

class _Task1PageState extends State<Task1Page> {
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
        content: Text('Teksti u ndryshua në: $_text'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 1 - Ndrysho Tekstin"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _text,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: const Text("Ndrysho"),
            ),
          ],
        ),
      ),
    );
  }
}
