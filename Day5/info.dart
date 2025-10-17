import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rreth Aplikacionit')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book, size: 50),
            SizedBox(height: 20),
            Text('Library App v1.0'),
            Text('Krijuar me Flutter'),
          ],
        ),
      ),
    );
  }
}
