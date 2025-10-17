import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rreth aplikacionit')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '📘 Simple Flutter Web App',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Ky është një aplikacion i thjeshtë në Flutter Web me 3 faqe:\n\n'
                '1️⃣ Lista e librave\n'
                '2️⃣ Shtimi i librave të rinj\n'
                '3️⃣ Faqja e informacionit\n\n'
                'Autori: Olti Curri\nDita: Day 4 Flutter Challenge',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
