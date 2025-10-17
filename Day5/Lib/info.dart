import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Ky është një aplikacion Flutter Web i thjeshtë.\n'
            'Ai merr të dhëna nga një API publike (JSONPlaceholder)\n'
            'dhe tregon listën e posteve me detajet e tyre.\n\n'
            'Autori: [Emri yt]',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
