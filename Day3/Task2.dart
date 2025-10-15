import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista e Artikujve',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ListaArtikujveScreen(),
    );
  }
}

class ListaArtikujveScreen extends StatefulWidget {
  @override
  State<ListaArtikujveScreen> createState() => _ListaArtikujveScreenState();
}

class _ListaArtikujveScreenState extends State<ListaArtikujveScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _artikuj = [];

  void _shtoArtikull() {
    String tekst = _controller.text.trim();
    if (tekst.isNotEmpty) {
      setState(() {
        _artikuj.add(tekst);
        _controller.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Artikulli "$tekst" u shtua!')),
      );
    }
  }

  void _fshiArtikull(int index) {
    String fshirur = _artikuj[index];
    setState(() {
      _artikuj.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Artikulli "$fshirur" u fshi!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista e Artikujve')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Shto artikull',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _shtoArtikull,
                  child: Text('Shto'),
                ),
              ],
            ),
            SizedBox(height: 20),

          
            Expanded(
              child: _artikuj.isEmpty
                  ? Center(
                      child: Text(
                        'Asnjë artikull i shtuar ende.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _artikuj.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(_artikuj[index]),
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
