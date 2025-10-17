import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(const MaterialApp(home: UserListPage()));
}
class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  Future<List<dynamic>> getUsers() async {
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Error loading users');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: FutureBuilder<List<dynamic>>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Error loading data')));
            });
            return const Center(child: Text('Something went wrong'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                final u = users[i];
                return ListTile(
                  title: Text(u['name']),
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
          }
        },
      ),
    );
  }
}
class UserDetailPage extends StatelessWidget {
  final Map user;
  const UserDetailPage({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user['name']}', style: const TextStyle(fontSize: 18)),
            Text('Email: ${user['email']}', style: const TextStyle(fontSize: 16)),
            Text('Phone: ${user['phone']}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
