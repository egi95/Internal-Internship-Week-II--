import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rreth Aplikacionit')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📚 Mini Project – Day 5',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Text('Ky aplikacion është ndërtuar me Flutter Web.'),
            SizedBox(height: 10),
            Text('Përdor:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('• 3 faqe (Home, Add, Info)\n'
                '• setState() për përditësime\n'
                '• SnackBar për njoftime\n'
                '• Navigim me Navigator.pushNamed\n'),
            SizedBox(height: 20),
            Text('Autor: Mal Llozana'),
            Text('Data: 17 Tetor 2025'),
          ],
        ),
      ),
    );
  }
}
