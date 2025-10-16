import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MAterialApp(
      home: ListManager(),
      debugShowCheckModeBanner: false,
    );
  }
}

class ListManager extends StatefulWidget { 
  @override
  _ListManagerstate createState() => _ListManagerState();
}
class ListeManagerstate extends State<ListManager> {
  List<String>items = [];
  TextEditingController controller = TextEditingController();

  void addItem() {
    String text = controller.text.trim();
    if (text.isEmpty) return; 
    setState(() { 
      items.add(text);
      controller.clear();
    });
    Scaffoldmessengersenger.of(context),showSnackBar(
      SnackBar(content: Text("artikulli u shtua!)),
    );
  }

  void removeItem(int index) { 
  String removed = items[index];
  setState(() { 
    items.removeAt(index);
  });
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Artikulli '$removed' u fshi")),
  );
}

@override
Widget build(BuildCOntext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Menaxher Listash")),
    body: Padding(
      padding: edgeInsets.all(16),
      child: [
        Row(
          children: [
            Expanded(
               child: TextField(
                 controller: controller,
                   decoratiom: InputDecoration(
                      hintText: "Shto artikull",
                    ),
                  ],
                ),
                SizedBox(width:10),
                ElevatedButton(
                 onPressed: addItem,
                 child: Text("Shto"),
              ),
            ],
          ),
          SizedBox(height: 20),
          expanded(
            child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTitle(
                title: Text (item[index]) {
                trailing: IconButton(
                  icon: icon(Icons,delete),
                  onPressed: () => removeItem(index),
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
      
