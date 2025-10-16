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
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: ListaArtikujveScreen(),
    );
  }
}

class ListaArtikujveScreen extends StatefulWidget {
  @override
  _ListaArtikujveScreenState createState() => _ListaArtikujveScreenState();
}

class _ListaArtikujveScreenState extends State<ListaArtikujveScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _artikujt = [];

  void _shtoArtikull() {
    final tekst = _controller.text.trim();
    if (tekst.isNotEmpty) {
      setState(() {
        _artikujt.add(tekst);
        _controller.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Artikulli u shtua!')),
      );
    }
  }

  void _fshiArtikull(int index) {
    final artikull = _artikujt[index];
    setState(() {
      _artikujt.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fshive: "$artikull"')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menaxhues Artikujsh')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Fusha e shkrimit + butoni
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Shkruaj një artikull',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _shtoArtikull(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _shtoArtikull,
                  child: Text('Shto'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Lista e artikujve
            Expanded(
              child: _artikujt.isEmpty
                  ? Center(
                      child: Text(
                        'Nuk ka artikuj ende!',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _artikujt.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
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
