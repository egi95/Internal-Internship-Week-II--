import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final _controller = TextEditingController();
  List<String> items = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Lista')),
        body: Column(
          children: [
            TextField(controller: _controller),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    items.add(_controller.text);
                    _controller.clear();
                  });
                }
              },
              child: Text('Shto'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (c, i) => ListTile(
                  title: Text(items[i]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      var deleted = items[i];
                      setState(() => items.removeAt(i));
                      ScaffoldMessenger.of(c).showSnackBar(
                        SnackBar(content: Text('$deleted u fshi')),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
