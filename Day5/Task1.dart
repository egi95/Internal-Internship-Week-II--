import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Item {
  int id;
  String title;
  String description;
  Item({required this.id, required this.title, required this.description});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 5 - InMemory App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> _items = [
    Item(id: 1, title: 'Libri 1', description: 'Përshkrim i Librit 1'),
    Item(id: 2, title: 'Libri 2', description: 'Përshkrim i Librit 2'),
  ];
  int _nextId = 3;

  void _addItem(String title, String description) {
    setState(() {
      _items.add(Item(id: _nextId++, title: title, description: description));
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Artikulli u shtua')),
    );
  }

  void _deleteItem(int id) {
    setState(() => _items.removeWhere((e) => e.id == id));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Artikulli u fshi')),
    );
  }

  void _goToAdd() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddOrDetailScreen()),
    );
    if (result != null && result is Map<String, String>) {
      final title = result['title'] ?? '';
      final desc = result['description'] ?? '';
      if (title.isNotEmpty) _addItem(title, desc);
    }
  }

  void _goToDetail(Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => AddOrDetailScreen(
          item: item,
          onDelete: _deleteItem,
        ),
      ),
    );
  }

  void _goToInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => InfoScreen()),
    );
  }

  void _confirmDelete(int id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Fshi artikullin?'),
        content: Text('A jeni të sigurt që doni ta fshini këtë artikull?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Anullo')),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _deleteItem(id);
            },
            child: Text('Fshi'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Librave'),
        actions: [
          IconButton(onPressed: _goToInfo, icon: Icon(Icons.info_outline)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _items.isEmpty
                  ? Center(child: Text('Nuk ka artikuj.'))
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (ctx, i) {
                        final item = _items[i];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(item.title),
                            subtitle: Text(item.description),
                            onTap: () => _goToDetail(item),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _confirmDelete(item.id),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            ElevatedButton.icon(
              onPressed: _goToAdd,
              icon: Icon(Icons.add),
              label: Text('Shto'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddOrDetailScreen extends StatefulWidget {
  final Item? item;
  final Function(int)? onDelete;

  AddOrDetailScreen({this.item, this.onDelete});

  @override
  _AddOrDetailScreenState createState() => _AddOrDetailScreenState();
}

class _AddOrDetailScreenState extends State<AddOrDetailScreen> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _titleCtrl.text = widget.item!.title;
      _descCtrl.text = widget.item!.description;
    }
  }

  void _save() {
    final title = _titleCtrl.text.trim();
    final desc = _descCtrl.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Titulli është i detyrueshëm')));
      return;
    }
    if (widget.item == null) {
      Navigator.pop(context, {'title': title, 'description': desc});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Editimi nuk ruhet (opsional)')));
    }
  }

  void _delete() {
    if (widget.item != null && widget.onDelete != null) {
      widget.onDelete!(widget.item!.id);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDetail = widget.item != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isDetail ? 'Detajet e Artikullit' : 'Shto Artikull të Ri'),
        actions: isDetail
            ? [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: _delete,
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleCtrl,
              decoration: InputDecoration(labelText: 'Titulli'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _descCtrl,
              decoration: InputDecoration(labelText: 'Përshkrimi'),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: Text(isDetail ? 'OK' : 'Shto'),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rreth Aplikacionit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Day 5 - Mini Project',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Ky është një aplikacion Flutter Web që ruan të dhëna në memory.'),
            SizedBox(height: 10),
            Text('Karakteristikat:'),
            Text('- 3 faqe: Lista, Shto/Detaje, Rreth'),
            Text('- Përdor setState() dhe SnackBar për feedback'),
            SizedBox(height: 12),
            Text('Created by: Deon Tahiri', style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
