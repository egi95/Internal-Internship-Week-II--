import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rreth Aplikacionit')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Ky është një aplikacion i thjeshtë me Flutter Web.',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Autori: Emri Juaj'),
            Text('Email: juaj@email.com'),
          ],
        ),
      ),
    );
  }
}
