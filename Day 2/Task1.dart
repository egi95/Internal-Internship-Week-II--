import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ndërrues Teksti',
      home: TextChangerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TextChangerPage extends StatefulWidget {
  @override
  _TextChangerPageState createState() => _TextChangerPageState();
}

class _TextChangerPageState extends State<TextChangerPage> {
  String _teksti = "Përshëndetje";

  void _ndryshoTekstin() {
    setState(() {
      _teksti = _teksti == "Përshëndetje" ? "U përditësua!" : "Përshëndetje";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Teksti u ndryshua!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buton që ndryshon tekstin'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _teksti,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ndryshoTekstin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
              child: Text(
                'Ndrysho tekstin',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
