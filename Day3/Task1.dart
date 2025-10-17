import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NdryshoTekstin(),
    );
  }
}

class NdryshoTekstin extends StatefulWidget {
  @override
  State<NdryshoTekstin> createState() => _NdryshoTekstinState();
}

class _NdryshoTekstinState extends State<NdryshoTekstin> {
  String _teksti = "Përshëndetje";

  void _ndryshoTekstin() {
    setState(() {
      if (_teksti == "Përshëndetje") {
        _teksti = "U përditësua!";
      } else {
        _teksti = "Përshëndetje";
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Teksti u ndryshua!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 1 – Ndrysho Tekstin"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _teksti,
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ndryshoTekstin,
              child: Text("Ndrysho tekstin"),
            ),
          ],
        ),
      ),
    );
  }
}
