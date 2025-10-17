import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutter Mini Project - Day 5',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                'Ky aplikacion u ndërtua me Flutter Web.\n'
                'Ka 3 faqe: Home, Add, dhe Info.\n'
                'Të dhënat ruhen në memorien lokale (List).',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text('Autori: [Emri juaj]', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
