import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: UserListScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class UserListScreen extends StatefulWidget {
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gabim gjatë marrjes së të dhënave!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Përdoruesit')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Gabim gjatë ngarkimit të të dhënave'),
            );
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(user: user),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('Nuk ka të dhëna.'));
          }
        },
      ),
    );
  }
}

class UserDetailScreen extends StatelessWidget {
  final Map user;
  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emri: ${user['name']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user['email']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Telefoni: ${user['phone']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
