import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rreth aplikacionit')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Ky është mini-projekti i Day 5.\n'
            'Krijuar nga [Emri yt].\n'
            'Ky aplikacion demonstron Flutter UI dhe setState().',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
