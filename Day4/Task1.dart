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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internship Day 4 - Task 1',
      home: UserListPage(),
    );
  }
}

// ----------------------------
// MAIN PAGE (List of Users)
// ----------------------------
class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<dynamic>> _usersFuture;

  // Fetch users from API
  Future<List<dynamic>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gabim gjatë marrjes së të dhënave: $e')),
      );
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    _usersFuture = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Përdoruesit (Users)"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Error state
            return Center(
              child: Text(
                'Gabim: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            // Data loaded successfully
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final name = user['name'] ?? 'Pa emër';
                final email = user['email'] ?? '';
                final phone = user['phone'] ?? '';

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: Text(name),
                    subtitle: Text(email),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserDetailPage(
                            name: name,
                            email: email,
                            phone: phone,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            // Empty data
            return const Center(child: Text('Nuk u gjetën të dhëna.'));
          }
        },
      ),
    );
  }
}

// ----------------------------
// DETAIL PAGE (User Details)
// ----------------------------
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
    // Shorten the name (e.g. "Alk Isufaj" → "Alk I")
    String shortName = _shortenName(name);

    return Scaffold(
      appBar: AppBar(
        title: Text(shortName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Emri: $name", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Email: $email", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Telefon: $phone", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to shorten name (e.g. "Alk Isufaj" → "Alk I")
  String _shortenName(String fullName) {
    List<String> parts = fullName.trim().split(' ');
    if (parts.length == 1) return parts.first;
    return '${parts.first} ${parts.last[0].toUpperCase()}';
  }
}
