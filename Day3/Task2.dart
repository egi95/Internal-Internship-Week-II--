import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaArtikujve(),
    );
  }
}

class ListaArtikujve extends StatefulWidget {
  @override
  State<ListaArtikujve> createState() => _ListaArtikujveState();
}

class _ListaArtikujveState extends State<ListaArtikujve> {
  final TextEditingController _controller = TextEditingController();
  List<String> _artikuj = [];

  void _shtoArtikull() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _artikuj.add(text);
      });
      _controller.clear();
    }
  }

  void _fshiArtikull(int index) {
    String emri = _artikuj[index];
    setState(() {
      _artikuj.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Artikulli '$emri' u fshi!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista e artikujve"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Fusha e input-it dhe butoni
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Shto artikull",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _shtoArtikull,
                  child: Text("Shto"),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Lista dinamike me artikujt
            Expanded(
              child: ListView.builder(
                itemCount: _artikuj.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_artikuj[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _fshiArtikull(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
