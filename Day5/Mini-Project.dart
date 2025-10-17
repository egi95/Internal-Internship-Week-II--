Main.dart 
import 'package:flutter/material.dart';
import 'home.dart';
import 'add_book.dart';
import 'info.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/add': (context) => AddBookPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}

Home.dart
import 'package:flutter/material.dart';
import 'home.dart';
import 'add_book.dart';
import 'info.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/add': (context) => AddBookPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}

Add_book.dart 
import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  void _saveBook() {
    final title = _titleController.text;
    final author = _authorController.text;

    if (title.isEmpty || author.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields!')),
      );
      return;
    }

    Navigator.pop(context, {'title': title, 'author': author});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Book')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Book Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveBook,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

Info.dart 
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About App')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                'Book Manager v1.0\nDeveloped by Eri Lili\nFlutter Web Project – Day 5',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
