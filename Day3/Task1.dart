import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _teksti = "Përshëndetje";
  int _numeruesi = 0;
  bool _ndryshoTekstin = true;

  void _veprimi() {
    setState(() {
      if (_ndryshoTekstin) {
        // Ndërron tekstin
        _teksti = _teksti == "Përshëndetje" ? "U përditësua!" : "Përshëndetje";
      } else {
        // Rrit numëruesin
        _numeruesi++;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_ndryshoTekstin
            ? 'Teksti u ndryshua!'
            : 'Numëruesi u rrit në $_numeruesi'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ndërrim teksti ose numërues'),
        backgroundColor: Colors.pink,
        actions: [
          Switch(
            value: _ndryshoTekstin,
            onChanged: (value) {
              setState(() {
                _ndryshoTekstin = value;
              });
            },
            activeColor: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _ndryshoTekstin
                  ? _teksti
                  : 'Numëruesi: $_numeruesi',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _veprimi,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              ),
              child: Text(
                _ndryshoTekstin ? 'Ndrysho tekstin' : 'Rrit numëruesin',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
