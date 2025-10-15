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
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const ListScreen(),
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
  final List<String> _items = []; // lista e artikujve

  void _addItem() {
    if (_controller.text.trim().isEmpty) return; // mos shto bosh
    setState(() {
      _items.add(_controller.text.trim());
    });
    _controller.clear(); // pastro tekstin
  }

  void _removeItem(int index) {
    String removed = _items[index];
    setState(() {
      _items.removeAt(index);
    });

    // Shfaq SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Artikulli "$removed" u fshi!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista me shtim dhe fshirje")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Fusha e tekstit dhe butoni për shtim
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Shkruaj një artikull',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text('Shto'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Shfaq lista me ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_items[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(index),
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
