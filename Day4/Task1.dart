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
      title: 'Users List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UsersPage(),
    );
  }
}

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  Future<List<dynamic>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim gjatë marrjes së të dhënave.');
      }
    } catch (e) {
      throw Exception('Gabim: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista e Përdoruesve')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Gabim: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Asnjë përdorues nuk u gjet.'));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(user['name'][0]),
                  ),
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          name: user['name'],
                          email: user['email'],
                          phone: user['phone'],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const DetailPage({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detajet e Përdoruesit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Emri: $name',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Email: $email', style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text('Telefoni: $phone', style: TextStyle(fontSize: 16)),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    label: Text('Kthehu mbrapa'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
