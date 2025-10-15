import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ArtikujtPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ArtikujtPage extends StatefulWidget {
  @override
  _ArtikujtPageState createState() => _ArtikujtPageState();
}

class _ArtikujtPageState extends State<ArtikujtPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> _artikujt = [];

  void _shtoArtikull() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _artikujt.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _fshijArtikull(int index) {
    String artikulliFshire = _artikujt[index];
    setState(() {
      _artikujt.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('U fshi: $artikulliFshire')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Artikujve'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Shkruaj një artikull...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _shtoArtikull,
                  child: Text('Shto'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _artikujt.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_artikujt[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _fshijArtikull(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
