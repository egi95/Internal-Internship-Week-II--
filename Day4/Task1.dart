import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // për jsonDecode

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<dynamic>> usersFuture;

  @override
  void initState() {
    super.initState();
    usersFuture = fetchUsers();
  }

  // 🔹 Marrim të dhëna nga API
  Future<List<dynamic>> fetchUsers() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gabim gjatë marrjes së të dhënave");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista e Përdoruesve')),
      body: FutureBuilder<List<dynamic>>(
        future: usersFuture,
        builder: (context, snapshot) {
          // Gjendja 1: duke u ngarkuar
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Gjendja 2: gabim
          else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Gabim: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // Gjendja 3: ka të dhëna
          else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(user['name'][0]),
                  ),
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailScreen(user: user),
                      ),
                    );
                  },
                );
              },
            );
          }

          // Rast i papritur
          return const Center(child: Text("Nuk ka të dhëna"));
        },
      ),
    );
  }
}

// 🔹 Ekrani i detajeve
class UserDetailScreen extends StatelessWidget {
  final dynamic user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("👤 Emri: ${user['name']}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("📧 Email: ${user['email']}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("📞 Telefon: ${user['phone']}", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
