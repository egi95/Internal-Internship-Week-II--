// File: Day3/task2.dart

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 2 – Listë me shtim dhe fshirje',
      debugShowCheckedModeBanner: false,
      home: ListaArtikujve(),
    );
  }
}

class ListaArtikujve extends StatefulWidget {
  @override
  _ListaArtikujveState createState() => _ListaArtikujveState();
}

class _ListaArtikujveState extends State<ListaArtikujve> {
  List<String> artikujt = [];
  TextEditingController controller = TextEditingController();

  void shtoArtikull() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      artikujt.add(controller.text.trim());
      controller.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Artikulli u shtua!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void fshiArtikull(int index) {
    String emri = artikujt[index];

    setState(() {
      artikujt.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("U fshi: $emri"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista e artikujve")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: "Shkruaj artikullin",
                      border: OutlineInputBorder(),
                    ),
