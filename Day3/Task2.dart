import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 3 - Task 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> _artikuj = [];
  final TextEditingController _controller = TextEditingController();

  void _shtoArtikull() {
    final String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _artikuj.add(text);
        _controller.clear();
      });
      
      // SnackBar për shtim
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('U shtua artikulli: "$text"'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _fshijArtikull(int index) {
    final String artikulliUFshire = _artikuj[index];
    setState(() {
      _artikuj.removeAt(index);
    });
    
    // SnackBar për fshirje
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('U fshi artikulli: "$artikulliUFshire"'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Zhbëj',
          onPressed: () {
            setState(() {
              _artikuj.insert(index, artikulliUFshire);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Artikujve'),
      ),
      body: Column(
        children: [
          // Pjesa e shtimit të artikujve
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Shkruaj një artikull...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _shtoArtikull(),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _shtoArtikull,
                  child: Text('Shto'),
                ),
              ],
            ),
          ),
          
          // Pjesa e shfaqjes së listës
          Expanded(
            child: _artikuj.isEmpty
                ? Center(
                    child: Text(
                      'Nuk ka artikuj\nShto disa artikuj për të filluar!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _artikuj.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            _artikuj[index],
                            style: TextStyle(fontSize: 16),
                          ),
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
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
