void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ItemListPage(),
    );
  }
}

class ItemListPage extends StatefulWidget {
  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _items = []; 

  void _addItem() {
    if (_controller.text.trim().isEmpty) return; 

    setState(() {
      _items.add(_controller.text.trim());
      _controller.clear(); 
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Artikulli u shtua me sukses!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _removeItem(int index) {
    String removedItem = _items[index];

    setState(() {
      _items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Artikulli '$removedItem' u fshi!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista me shtim dhe fshirje"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Shto artikull",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addItem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: Text("Shto"),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Shfaqja e listës
            Expanded(
              child: _items.isEmpty
                  ? Center(
                      child: Text(
                        "Asnjë artikull nuk është shtuar ende.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(_items[index]),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeItem(index),
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
