import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Flutter Web',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String tekst = "Përshëndetje";
  int counter = 0;

  void _ndryshoTekstDheCounter() {
    setState(() {
      // Ndërron tekstin
      tekst = (tekst == "Përshëndetje") ? "U përditësua!" : "Përshëndetje";
      // Rrit counter
      counter++;
    });

    // Shfaq SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Veprimi u krye! Counter: $counter"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Web Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tekst,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ndryshoTekstDheCounter,
              child: Text('Kliko këtu'),
            ),
            SizedBox(height: 10),
            Text(
              'Numëruesi: $counter',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

