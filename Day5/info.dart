import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rreth aplikacionit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📱 Flutter Mini Project',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text(
              'Ky aplikacion u krijua si pjesë e Day 5 – Mini Project në Flutter Web. '
              'Ai shfaq përdorues nga një API dhe demonstron përdorimin e FutureBuilder, '
              'navigimit dhe menaxhimit të gjendjes me setState().',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text('👩‍💻 Autor: Alketa Bajramaj', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('🏫 Institucioni: British Gymnasium of Technology', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
