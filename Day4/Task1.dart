import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
final String name;
final String email;
final String phone;
User({required this.name, required this.email, required this.phone});
factory User.fromJson(Map<String, dynamic> j) =>
User(name: j['name'], email: j['email'], phone: j['phone']);
}

Future<List<User>> fetchUsers() async {
final r = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
if (r.statusCode == 200) {
final List data = json.decode(r.body);
return data.map((e) => User.fromJson(e)).toList();
} else {
throw Exception('Failed');
}
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return const MaterialApp(debugShowCheckedModeBanner: false, home: UsersPage());
}
}

class UsersPage extends StatefulWidget {
const UsersPage({super.key});
@override
State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
late Future<List<User>> futureUsers;
@override
void initState() {
super.initState();
futureUsers = fetchUsers();
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Users')),
body: FutureBuilder<List<User>>(
future: futureUsers,
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(child: CircularProgressIndicator());
}
if (snapshot.hasError) {
return const Center(child: Text('Error'));
}
final users = snapshot.data ?? [];
return ListView.builder(
itemCount: users.length,
itemBuilder: (context, index) {
final u = users[index];
return ListTile(
title: Text(u.name),
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => UserDetailPage(user: u)),
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
final User user;
const UserDetailPage({super.key, required this.user});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Details')),
body: Padding(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(user.name, style: Theme.of(context).textTheme.headlineSmall),
const SizedBox(height: 8),
Text(user.email),
const SizedBox(height: 8),
Text(user.phone),
],
),
),
);
}
}
