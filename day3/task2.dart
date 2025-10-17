import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListaArtikujve(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListaArtikujve extends StatefulWidget {
  @override
  State<ListaArtikujve> createState() => _ListaArtikujveState();
}

class _ListaArtikujveState extends State<ListaArtikujve> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _artikujt = [];

  void _shtoArtikull() {
    String tekst = _controller.text.trim();
    if (tekst.isNotEmpty) {
      setState(() {
        _artikujt.add(tekst);
        _controller.clear();
      });
    }
  }

  void _fshiArtikull(int index) {
    String emri = _artikujt[index];
    setState(() {
      _artikujt.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("U fshi artikulli: $emri")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista me Shtim & Fshirje")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Shto artikullin...",
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
            Expanded(
              child: ListView.builder(
                itemCount: _artikujt.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_artikujt[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _fshiArtikull(index),
                      ),
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
