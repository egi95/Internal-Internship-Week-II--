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
    final title = _titleController.text.trim();
    final author = _authorController.text.trim();

    if (title.isEmpty || author.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ju lutem plotësoni të gjitha fushat!')),
      );
      return;
    }

    Navigator.pop(context, {'title': title, 'author': author});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shto Libër')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Titulli:', style: TextStyle(fontSize: 16)),
            TextField(controller: _titleController),
            const SizedBox(height: 20),
            const Text('Autori:', style: TextStyle(fontSize: 16)),
            TextField(controller: _authorController),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _saveBook,
                child: const Text('Ruaj Librin'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
