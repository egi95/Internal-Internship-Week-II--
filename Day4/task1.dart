import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users API',
      home: const UsersPage(),
    );
  }
}

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  Future<List<dynamic>> fetchUsers() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Gabim në marrjen e të dhënave!");
    }

    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Përdoruesit")),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (snapshot.hasError) {
            return Center(
              child: Text("Gabim: ${snapshot.error}"),
            );
          }

          // Data
          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final u = users[index];
              return ListTile(
                title: Text(u["name"]),
                subtitle: Text(u["email"]),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UserDetailPage(user: u),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final dynamic user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user["name"])),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Emri: ${user["name"]}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("Email: ${user["email"]}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Telefoni: ${user["phone"]}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
