void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeTextPage(),
    );
  }
}

class ChangeTextPage extends StatefulWidget {
  @override
  State<ChangeTextPage> createState() => _ChangeTextPageState();
}

class _ChangeTextPageState extends State<ChangeTextPage> {
  String message = "Përshëndetje"; 
  int counter = 0; // numërues opsional

  void _changeText() {
    setState(() {
      // Ndërron tekstin në çdo klikim
      if (message == "Përshëndetje") {
        message = "U përditësua!";
      } else {
        message = "Përshëndetje";
      }

      counter++;
    });

    // Shfaq SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Veprimi u krye! Numëruesi: $counter"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buton që ndryshon tekstin"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                backgroundColor: Colors.blue,
              ),
              child: Text(
                "Ndrysho Tekstin",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
