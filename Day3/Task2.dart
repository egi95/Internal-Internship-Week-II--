import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista me shtim dhe fshirje',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListaScreen extends StatefulWidget {
  const ListaScreen({super.key});

  @override
  State<ListaScreen> createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _artikujt = [];

  void _shtoArtikull() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _artikujt.add(_controller.text.trim());
    });
    _controller.clear();
  }

  void _fshiArtikull(int index) {
    String emri = _artikujt[index];
    setState(() {
      _artikujt.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Artikulli '$emri' u fshi!"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista me shtim dhe fshirje'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Shto artikull',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _shtoArtikull,
                  child: const Text('Shto'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _artikujt.isEmpty
                  ? const Center(
                      child: Text(
                        'Nuk ka artikuj ende.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _artikujt.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(_artikujt[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
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
