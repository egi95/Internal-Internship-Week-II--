import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String teksti = 'Përshëndetje';
  int counter = 0;

  void ndryshoTekstin() {
    setState(() {
      if (teksti == 'Përshëndetje') {
        teksti = 'U përditësua!';
      } else {
        teksti = 'Përshëndetje';
      }
      counter++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Teksti u ndryshua! Klikime: $counter'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikacion Flutter Web'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                teksti,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: ndryshoTekstin,
                child: Text('Kliko këtu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

