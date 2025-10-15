import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Artikujve',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ItemListPage(),
    );
  }
}

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> items = [];

  void _shtoItem() {
    String tekst = _controller.text.trim();
    if (tekst.isNotEmpty) {
      setState(() {
        items.add(tekst);
      });
      _controller.clear();
    }
  }

  void _fshiItem(int index) {
    String removedItem = items[index];
    setState(() {
      items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Artikulli "$removedItem" u fshi.'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista Artikujve')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Shkruaj artikull',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _shtoItem,
                  child: Text('Shto'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: items.isEmpty
                  ? Center(child: Text('Lista është bosh.'))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(items[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _fshiItem(index),
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

