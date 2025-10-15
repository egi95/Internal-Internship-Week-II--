import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista me shtim dhe fshirje',
      home: ListaMeShtimDheFshirje(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListaMeShtimDheFshirje extends StatefulWidget {
  @override
  _ListaMeShtimDheFshirjeState createState() => _ListaMeShtimDheFshirjeState();
}

class _ListaMeShtimDheFshirjeState extends State<ListaMeShtimDheFshirje> {
  final TextEditingController _kontroller = TextEditingController();
  List<String> _artikujt = [];

  void _shtoArtikull() {
    final tekst = _kontroller.text.trim();
    if (tekst.isNotEmpty) {
      setState(() {
        _artikujt.add(tekst);
      });
      _kontroller.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Artikulli u shtua!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _fshiArtikull(int index) {
    final artikulli = _artikujt[index];
    setState(() {
      _artikujt.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Artikulli "$artikulli" u fshi!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listë me shtim dhe fshirje'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _kontroller,
                    decoration: InputDecoration(
                      labelText: 'Shto artikull',
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
              child: _artikujt.isEmpty
                  ? Center(
                      child: Text(
                        'Lista është bosh',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _artikujt.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 4),
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
