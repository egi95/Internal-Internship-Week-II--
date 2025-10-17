import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: UsersScreen()));
}

class UsersScreen extends StatefulWidget {
  @override
  State<UsersScreen> createState() {
    return _UsersScreenState();
  }
}

class _UsersScreenState extends State<UsersScreen> {
  Future? usersFuture;

  Future getUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gabim ne marrjen e te dhenave');
    }
  }

  @override
  void initState() {
    super.initState();
    usersFuture = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista e Perdoruesve')),
      body: FutureBuilder(
        future: usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } 
          else if (snapshot.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gabim gjate marrjes se te dhenave')),
            );
            return Center(child: Text('Gabim ne ngarkim'));
          } 
          else if (snapshot.hasData) {
            var users = snapshot.data;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return ListTile(
                  title: Text(user['name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UserDetailScreen(
                            name: user['name'],
                            email: user['email'],
                            phone: user['phone'],
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          } 
          else {
            return Center(child: Text('Nuk ka te dhena'));
          }
        },
      ),
    );
  }
}

class UserDetailScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  UserDetailScreen({required this.name, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detajet e Perdoruesit')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emri: $name', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Email: $email'),
            SizedBox(height: 10),
            Text('Telefon: $phone'),
          ],
        ),
      ),
    );
  }
}
