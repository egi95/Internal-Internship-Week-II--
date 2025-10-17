import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ItemListScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _items = [];

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _deleteItem(int index) {
    String deleted = _items[index];
    setState(() {
      _items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("U fshi: $deleted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar
