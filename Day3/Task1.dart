import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shembull Flutter Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TekstiMeButon(),
    );
  }
}

class TekstiMeButon extends StatefulWidget {
  @override
  _TekstiMeButonState createState() => _TekstiMeButonState();
}

class _TekstiMeButonState extends State<TekstiMeButon> {
  String _teksti = "Përshëndetje";
  int _numeruesi = 0;
  bool _ndryshoTekstin = true;

  void _perditeso() {
    setState(() {
      if (_ndryshoTekstin) {
        // Ndërron tekstin
        _teksti = _teksti == "Përshëndetje" ? "U përditësua!" : "Përshëndetje";
      } else {
        // Rrit numëruesin
        _numeruesi++;
      }
    });

    // Shfaq një SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_ndryshoTekstin
            ? 'Teksti u ndryshua!'
            : 'Numëruesi: $_numeruesi'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shembull me setState()'),
        actions: [
          Switch(
            value: _ndryshoTekstin,
            onChanged: (vlera) {
              setState(() {
                _ndryshoTekstin = vlera;
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
              _ndryshoTekstin ? _teksti : 'Numëruesi: $_numeruesi',
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _perditeso,
              child: Text('Kliko për të përditësuar'),
            ),
          ],
        ),
      ),
    );
  }
}
