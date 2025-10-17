import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  final Function(String, String) onAdd;

  const AddBookPage({super.key, required this.onAdd});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  void _submit() {
    if (_titleController.text.isNotEmpty && _authorController.text.isNotEmpty) {
      widget.onAdd(_titleController.text, _authorController.text);
      Navigator.pop(context);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Libri u shtua!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shto Libër')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titulli'),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Autori'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Shto Librin'),
            ),
          ],
        ),
      ),
    );
  }
}
