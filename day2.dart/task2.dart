// task2.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListaArtikujve(),
  ));
}

class ListaArtikujve extends StatefulWidget {
  @override
  _ListaArtikujveState createState() => _ListaArtikujveState();
}

class _ListaArtikujveState extends State<ListaArtikujve> {
  // Lista ku do ruhen artikujt
  List<String> artikuj = [];

  // Kontrolluesi për TextField
  final TextEditingController _kontroller = TextEditingController();

  // Funksion për shtimin e artikullit
  void shtoArtikull() {
    String text = _kontroller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        artikuj.add(text);
      });
      _kontroller.clear();
    }
  }

  // Funksion për fshirjen e artikullit
  void fshijArtikull(int index) {
    String artikulli = artikuj[index];
    setState(() {
      artikuj.removeAt(index);
    });

    // Shfaq një SnackBar pas fshirjes
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('U fshi: $artikulli')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Artikujve'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Input për shtim artikujsh
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _kontroller,
                    decoration: InputDecoration(
                      labelText: 'Shkruaj artikullin',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: shtoArtikull,
                  child: Text('Shto'),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Shfaqja e listës me ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: artikuj.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(artikuj[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => fshijArtikull(index),
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
