import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserListPage(),
    );
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  // Funksioni që bën kërkesën GET
  Future<List<dynamic>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim: status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gabim gjatë marrjes së të dhënave: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista e Përdoruesve')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          // Gjendja loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Gjendja error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Gabim gjatë ngarkimit të të dhënave: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // Gjendja data
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(
                          name: user['name'],
                          email: user['email'],
                          phone: user['phone'],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }

          // Gjendje bosh
          return const Center(child: Text('Nuk ka të dhëna.'));
        },
      ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const UserDetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emër: $name', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Email: $email', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Telefon: $phone', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
