import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rreth Aplikacionit')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flutter_dash, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                'Mini Project Flutter Web',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Krijuar nga Olt Istogu'),
              SizedBox(height: 5),
              Text('Versioni 1.0.0'),
            ],
          ),
        ),
      ),
    );
  }
}
