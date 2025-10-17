import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rreth Aplikacionit')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Aplikacion Demo Offline',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
                'Ky aplikacion është ndërtuar për të treguar përdorimin e listave, navigimit dhe setState në Flutter Web.'),
            SizedBox(height: 10),
            Text('Autori: Erdet',
                style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
