import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ndryshimi i Tekstit',
      home: TextChangePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TextChangePage extends StatefulWidget {
  @override
  _TextChangePageState createState() => _TextChangePageState();
}

class _TextChangePageState extends State<TextChangePage> {
  String _text = "Përshëndetje"; // Teksti fillestar
  int _counter = 0; // Opsionale nëse do përdorësh numëruesin

  void _changeText() {
    setState(() {
      // Ndërron tekstin
      if (_text == "Përshëndetje") {
        _text = "U përditësua!";
      } else {
        _text = "Përshëndetje";
      }

      // Opsionalisht, mund të rritësh numëruesin:
      _counter++;
    });

    // Shfaq SnackBar pas përditësimit
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Teksti u përditësua ($_counter herë)"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buton që ndryshon tekstin'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _text,
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: Text('Ndrysho tekstin'),
            ),
          ],
        ),
      ),
    );
  }
}
