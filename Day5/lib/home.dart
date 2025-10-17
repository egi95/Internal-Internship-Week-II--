import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> items;
  final Function(String) onAddPressed;

  HomePage({required this.items, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Artikujve'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/info'),
          ),
        ],
      ),
      body: items.isEmpty
          ? Center(child: Text('Nuk ka artikuj.'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(items[index]),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
