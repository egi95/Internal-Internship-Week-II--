main.dart
import 'package:flutter/material.dart';
import 'home.dart'; // lidhja me ekranin kryesor

void main() {
  runApp(MaterialApp(
    title: 'Users App',
    home: HomeScreen(),
  ));
}

home.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> users;

  @override
  void initState() {
    super.initState();
    users = fetchUsers();
  }

  Future<List<dynamic>> fetchUsers() async {
    try {
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ka ndodhur gabim: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista e Përdoruesve')),
      body: FutureBuilder<List<dynamic>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Gabim: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            var userList = snapshot.data!;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                var user = userList[index];
                return ListTile(
                  title: Text(user['name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(user: user),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('Nuk ka të dhëna'));
          }
        },
      ),
    );
  }
}


detail.dart


import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map user;

  DetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user['name'])),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emri: ${user['name']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user['email']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Telefon: ${user['phone']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}


