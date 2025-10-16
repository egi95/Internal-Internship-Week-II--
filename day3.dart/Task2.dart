import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 1 – Flutter Day 3',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // fillimisht teksti bazë
  String message = "Përshëndetje!";
  int counter = 0;

  void changeText() {
    setState(() {
      // opsioni 1: ndërron tekstin
      if (message == "Përshëndetje!") {
        message = "U përditësua!";
      } else {
        message = "Përshëndetje!";
      }

      // opsioni 2: rrit numëruesin
      counter++;
    });

    // shfaq SnackBar pas veprimit
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("UI u përditësua! (Klikime: $counter)"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 1 – Ndrysho Tekstin"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: changeText,
              child: Text("Kliko për ta ndryshuar"),
            ),
            SizedBox(height: 20),
            Text(
              "Numëruesi: $counter",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
