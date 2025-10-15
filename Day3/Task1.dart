import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Task1()));

class Task1 extends StatefulWidget {
  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  String txt = 'Përshëndetje';
  int counter = 0;

  void ndrysho() {
    setState(() {
      // Ndryshon tekstin ose rrit counter
      txt = txt == 'Përshëndetje' ? 'U përditësua!' : 'Përshëndetje';
      counter++; // opsionale
    });

    // Shfaq SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Veprimi u krye! Numri: $counter')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 1 – Buton')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(txt, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: ndrysho, child: Text('Kliko')),
          ],
        ),
      ),
    );
  }
}

