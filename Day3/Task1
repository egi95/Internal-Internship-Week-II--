import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = "Përshëndetje";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Test App")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message, style: TextStyle(fontSize: 25)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    message = (message == "Përshëndetje")
                        ? "U përditësua!"
                        : "Përshëndetje";
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Teksti u përditësua!")),
                  );
                },
                child: Text("Kliko"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
