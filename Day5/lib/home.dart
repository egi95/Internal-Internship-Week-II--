import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ['Artikulli 1', 'Artikulli 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home / Lista')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() => items.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Artikulli u fshi!')),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newItem = await Navigator.pushNamed(context, '/add');
          if (newItem != null) {
            setState(() => items.add(newItem as String));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Artikulli u shtua!')),
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menu')),
            ListTile(
              title: Text('Rreth aplikacionit'),
              onTap: () => Navigator.pushNamed(context, '/info'),
            ),
          ],
        ),
      ),
    );
  }
}
