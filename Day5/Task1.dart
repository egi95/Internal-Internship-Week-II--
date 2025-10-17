import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["Libri 1", "Libri 2", "Libri 3"];

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Artikulli u fshi me sukses!')),
    );
  }

  Future<void> goToAddPage() async {
    final newItem = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPage()),
    );
    if (newItem != null && newItem is String) {
      setState(() {
        items.add(newItem);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Artikulli u shtua me sukses!')),
      );
    }
  }

  void goToInfoPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e Librave'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: goToInfoPage,
          ),
        ],
      ),
      body: items.isEmpty
          ? const Center(child: Text('Asnjë libër nuk u gjet.'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    title: Text(items[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToAddPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _controller = TextEditingController();

  void addItem() {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ju lutem shkruani një emër!')),
      );
      return;
    }
    Navigator.pop(context, _controller.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shto Libër')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Titulli i librit',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: addItem,
              icon: const Icon(Icons.check),
              label: const Text('Shto'),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rreth Aplikacionit')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📘 Flutter Web App',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Ky aplikacion është ndërtuar me Flutter Web dhe përmban 3 faqe:\n'
              '• Home: lista e librave\n'
              '• Add: shto libër të ri\n'
              '• Info: informacion bazë për aplikacionin.\n\n'
              'Autori: Aron Rrmoku\nVersioni: 1.0\n',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

