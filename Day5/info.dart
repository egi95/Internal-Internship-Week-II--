import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About App')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mini Project – Flutter Web',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Ky aplikacion është ndërtuar si pjesë e Day 5 Mini Project, '
              'duke përdorur Flutter, Dart, dhe konceptet e FutureBuilder, '
              'setState, dhe navigimit midis faqeve.',
            ),
            SizedBox(height: 20),
            Text('Autori: [Vendos emrin tënd]', style: TextStyle(fontSize: 16)),
            Text('Versioni: 1.0.0', style: TextStyle(fontSize: 16)),
            Spacer(),
            Center(
              child: Text('© 2025 Mini Project Flutter Web', style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }
}
