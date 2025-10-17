import 'package:flutter/material.dart';
import 'add_book.dart';
import 'info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> books = [
    {'title': 'Flutter Basics', 'author': 'Ana Kola'},
    {'title': 'Dart Programming', 'author': 'Besi Hoxha'},
  ];

  void _addBook(String title, String author) {
    setState(() {
      books.add({'title': title, 'author': author});
    });
  }

  void _deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteka Ime'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const InfoPage()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]['title']!),
            subtitle: Text(books[index]['author']!),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteBook(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddBookPage(onAdd: _addBook)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
