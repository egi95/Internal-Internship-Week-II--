import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ndrysho Tekstin',
      home: NdryshoTekstin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NdryshoTekstin extends StatefulWidget {
  @override
  _NdryshoTekstinState createState() => _NdryshoTekstinState();
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

    // Shfaq SnackBar kur ndryshohet teksti
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Teksti u ndryshua!'),
        duration: Duration(seconds: 2),
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
              _teksti,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ndryshoTekstin,
              child: Text('Ndrysho tekstin'),
            ),
          ],
        ),
      ),
    );
  }
}
