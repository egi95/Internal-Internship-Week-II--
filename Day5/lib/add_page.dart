import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final Function(String) onAddItem;
  AddPage({required this.onAddItem});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _controller = TextEditingController();

  void _saveItem() {
    if (_controller.text.isNotEmpty) {
      widget.onAddItem(_controller.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Artikulli u shtua!")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shto Artikull')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Shkruaj artikullin'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveItem,
              child: Text('Shto'),
            ),
          ],
        ),
      ),
    );
  }
}
