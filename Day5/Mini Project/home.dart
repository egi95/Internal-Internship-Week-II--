import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> books = [
    {'title': 'Flutter Basics', 'author': 'John Doe'},
    {'title': 'Dart for Beginners', 'author': 'Jane Smith'},
  ];

  void _deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Book deleted!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('📚 Book List'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/info'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.book),
            title: Text(books[index]['title']!),
            subtitle: Text(books[index]['author']!),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteBook(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newBook = await Navigator.pushNamed(context, '/add');
          if (newBook != null && newBook is Map<String, String>) {
            setState(() {
              books.add(newBook);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Book added successfully!')),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
