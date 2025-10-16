import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ShoppingList()));
}

class ShoppingList extends StatefulWidget {
  @override
  State<ShoppingList> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  List<String> items = [];
  TextEditingController controller = TextEditingController();

  void _addItem() {
    String text = controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        items.add(text);
        controller.clear();
      });
    }
  }

  void _removeItem(int index) {
    String removedItem = items[index];
    setState(() {
      items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('U fshi: $removedItem'),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista e Artikujve')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Shkruaj artikull',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addItem,
                  child: Text('Shto'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _removeItem(index);
                      },
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
