import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> books = ["Flutter Basics", "Dart for Beginners", "UI Design"];

  void _removeItem(int index) {
    setState(() {
      books.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Item removed")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Book List"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(books[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeItem(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newBook = await Navigator.pushNamed(context, '/add');
          if (newBook != null && newBook is String && newBook.isNotEmpty) {
            setState(() {
              books.add(newBook);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Book added successfully")),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
