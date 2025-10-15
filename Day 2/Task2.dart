import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista me shtim dhe fshirje',
      home: ListaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> _artikujt = [];

  void _shtoArtikull() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _artikujt.add(_controller.text);
        _controller.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Artikulli u shtua!'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _fshiArtikull(int index) {
    String emri = _artikujt[index];
    setState(() {
      _artikujt.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('U fshi: $emri'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listë me shtim dhe fshirje'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Fusha e tekstit dhe butoni i shtimit
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Shkruaj artikullin',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _shtoArtikull,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                  child: Text('Shto'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Lista e artikujve
            Expanded(
              child: _artikujt.isEmpty
                  ? Center(
                      child: Text(
                        'Nuk ka artikuj.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _artikujt.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(_artikujt[index]),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _fshiArtikull(index),
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
