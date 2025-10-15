import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task 2 – Listë me shtim dhe fshirje',
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _artikujt = [];

  void _shtoArtikull() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _artikujt.add(text);
        _controller.clear();
      });
    }
  }

  void _fshiArtikull(int index) {
    final artikulliFshire = _artikujt[index];

    setState(() {
      _artikujt.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Artikulli "$artikulliFshire" u fshi.'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e Artikujve'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Fusha për shtim + butoni
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Shto një artikull',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _shtoArtikull,
                  child: const Text('Shto'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Lista e artikujve
            Expanded(
              child: _artikujt.isEmpty
                  ? const Center(child: Text('Nuk ka artikuj'))
                  : ListView.builder(
                      itemCount: _artikujt.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_artikujt[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
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
