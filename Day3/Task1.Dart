flutter config --enable-web
flutter create flutter_app_day3
cd flutter_app_day3
flutter run -d chrome

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Kjo është klasa kryesore e aplikacionit.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Day3 App',
      home: CounterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Kjo është faqja kryesore që ka një buton dhe një tekst.
class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  String message = "Përshëndetje 👋";
  int counter = 0;

  void _updateTextOrCounter() {
    setState(() {
      // Mund të zgjedhësh njërën nga këto logjika:
      // 1️⃣ Ndërron tekstin
      if (message == "Përshëndetje 👋") {
        message = "U përditësua! ✅";
      } else {
        message = "Përshëndetje 👋";
      }

      // 2️⃣ Ose rrit numëruesin (nëse do)
      counter++;
    });

    // Shfaq një SnackBar pas përditësimit
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("UI u përditësua! Numëruesi: $counter"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day3 Flutter Web App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Numëruesi: $counter',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _updateTextOrCounter,
              child: Text("Kliko për përditësim"),
            ),
          ],
        ),
      ),
    );
  }
}
