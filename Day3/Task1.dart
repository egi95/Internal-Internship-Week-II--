import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BUildContext context) {
    returm MaterialApp(
      home: TExtChangeApp(),
      debugShowCheckModeBanneer: false,
    );
  }
}

class TextChangerApp extends StatefulWidget {
  @override
  _TextChangeAppState createState() => _TextChangeAppState();
}

class _TextChangeAppSate extends Sate<TextChangeApp> {
  String text = "Pershendetje";

  void changeText() {
    setState(() {
      text = text == "Pershendetje" ? "U perditesua!" : "Pershendetje"; 
    });

    ScaffoldMessenger.of(context) {
      return Scaffold(
        appBar: AppBar(title: Text("Ndryshimi i Tekstit")),
        body: Center(
          child: Column(
            mainAxisAligment: MainAxisAligment.center, 
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeText,
                child: Text("Ndrysho tekstin"),
              ),
            ],
          ),
        ),
      );
    }
  }
