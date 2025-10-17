import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // për jsonDecode

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // funksioni që merr të dhënat nga API
  Future<List<dynamic>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // kthen listën e përdoruesve si objekt json
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
          // gjatë ngarkimit
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // nëse ka gabim
          if (snapshot.hasError) {
            return Center(
              child: Text('Gabim: ${snapshot.error}'),
            );
          }

          // nëse ka të dhëna
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // navigon në faqen e detajeve
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(
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

          // nëse nuk ka të dhëna
          return Center(child: Text('Nuk ka të dhëna.'));
        },
      ),
    );
  }
}

class UserDetailScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const UserDetailScreen({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detajet e përdoruesit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emri: $name', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Email: $email', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Telefoni: $phone', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

