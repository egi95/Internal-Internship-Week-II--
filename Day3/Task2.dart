// Flutter web - single-file example
// Save as lib/main.dart in a Flutter project and run with `flutter run -d chrome`

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggle & Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _greeting = 'Përshëndetje';
  int _counter = 0;

  void _toggleGreeting() {
    setState(() {
      _greeting = (_greeting == 'Përshëndetje') ? 'U përditësua!' : 'Përshëndetje';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Teksti u ndryshua në: "$_greeting"'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Numëruesi u rrit: $_counter'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shembull: setState + SnackBar'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _greeting,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Text(
                'Numërues: $_counter',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),

              // Button that toggles the greeting
              ElevatedButton.icon(
                onPressed: _toggleGreeting,
                icon: const Icon(Icons.sync),
                label: const Text('Ndrysho tekstin'),
              ),

              const SizedBox(height: 12),

              // Button that increments the counter
              ElevatedButton.icon(
                onPressed: _incrementCounter,
                icon: const Icon(Icons.add),
                label: const Text('Rrit numëruesin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
