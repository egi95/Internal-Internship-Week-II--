import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dita / Nata',
      home: const ModeSwitcher(),
    );
  }
}

class ModeSwitcher extends StatefulWidget {
  const ModeSwitcher({super.key});

  @override
  State<ModeSwitcher> createState() => _ModeSwitcherState();
}

class _ModeSwitcherState extends State<ModeSwitcher> {
  bool isDay = true; // fillon në mënyrën Dita

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDay ? Colors.white : Colors.black87,
      appBar: AppBar(
        title: Text(isDay ? "Dita" : "Nata"),
        backgroundColor: isDay ? Colors.blue : Colors.grey[900],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isDay = !isDay;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Moda u ndryshua në ${isDay ? "Dita" : "Nata"}",
                ),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          child: Text("Ndrysho Modën (${isDay ? "Nata" : "Dita"})"),
        ),
      ),
    );
  }
}
