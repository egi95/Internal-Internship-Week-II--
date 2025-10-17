main.dart


import 'package:flutter/material.dart';
import 'home.dart';
import 'add_book.dart';
import 'info.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/add': (context) => const AddBookPage(),
        '/info': (context) => const InfoPage(),
      },
    );
  }
}




home.dart


import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> books = [];

  void goToAddPage() async {
    final newBook = await Navigator.pushNamed(context, '/add');
    if (newBook != null) {
      setState(() {
        books.add(newBook as Map<String, String>);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Book added!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Books'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/info'),
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: books.isEmpty
          ? const Center(child: Text('No books yet'))
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(books[index]['title']!),
                  subtitle: Text(books[index]['author']!),
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




add_book.dart


import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();

  void saveBook() {
    if (titleController.text.isEmpty || authorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fill all fields!')),
      );
      return;
    }

    Navigator.pop(context, {
      'title': titleController.text,
      'author': authorController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Book')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Book Title'),
            ),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: saveBook, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}



info.dart


import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: const Center(
        child: Text(
          'Book Manager v1.0\nMade by Eri Lili',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
