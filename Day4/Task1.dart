import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users API Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  Future<List<dynamic>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Nuk mund të merren të dhënat nga API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista e Përdoruesve')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          // Gjendja e ngarkimit
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Gjendja e gabimit
          if (snapshot.hasError) {
            return Center(child: Text('Gabim: ${snapshot.error}'));
          }

          // Gjendja me të dhëna
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(user: user),
                      ),
                    );
                  },
                );
              },
            );
          }

          // Nëse s’ka të dhëna
          return Center(child: Text('Nuk ka të dhëna.'));
        },
      ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final dynamic user;

  const UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Emri: ${user['name']}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Email: ${user['email']}',
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text('Telefon: ${user['phone']}',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
