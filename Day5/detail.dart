import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map user;

  DetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('👤 Emri: ${user['name']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('📧 Email: ${user['email']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('📞 Telefoni: ${user['phone']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Kthehu prapa'),
            ),
          ],
        ),
      ),
    );
  }
}
