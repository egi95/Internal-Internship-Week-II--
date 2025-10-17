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
    {'title': 'Atomic Habits', 'author': 'James Clear'},
    {'title': 'Clean Code', 'author': 'Robert C. Martin'},
  ];

  void _addBook(Map<String, String> newBook) {
    setState(() {
      books.add(newBook);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Libri u shtua me sukses!')),
    );
  }

  void _deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Libri u fshi!')),
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
            onPressed: () => Navigator.pushNamed(context, '/info'),
          ),
        ],
      ),
      body: books.isEmpty
          ? const Center(child: Text('Nuk ka libra për t’u shfaqur'))
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  title: Text(book['title']!),
                  subtitle: Text(book['author']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteBook(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(builder: (_) => const AddBookPage()),
          );
          if (result != null) _addBook(result);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
