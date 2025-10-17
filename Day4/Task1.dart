dependencies:
  http: ^1.2.0
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

/// App bazë
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users (GET + FutureBuilder)',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const UsersPage(),
    );
  }
}

/// Model i thjeshtë për User
class User {
  final int id;
  final String name;
  final String email;
  final String phone;

  User({required this.id, required this.name, required this.email, required this.phone});

  factory User.fromJson(Map<String, dynamic> j) => User(
        id: j['id'] as int,
        name: j['name'] as String,
        email: j['email'] as String,
        phone: j['phone'] as String,
      );
}

/// Ekrani që sjell dhe shfaq përdoruesit
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<User>> _future;

  @override
  void initState() {
    super.initState();
    _future = _fetchUsers();
  }

  Future<List<User>> _fetchUsers() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final res = await http.get(uri);

    if (res.statusCode != 200) {
      // Kthe gabim për t’u kapur nga FutureBuilder
      throw Exception('Kërkesa dështoi (status: ${res.statusCode}).');
    }

    final data = jsonDecode(res.body) as List;
    return data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
  }

  void _retry() {
    setState(() {
      _future = _fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Përdoruesit')),
      body: FutureBuilder<List<User>>(
        future: _future,
        builder: (context, snapshot) {
          // LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ERROR
          if (snapshot.hasError) {
            // Opsion: shfaq edhe SnackBar një herë
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final msg = snapshot.error.toString();
              final messenger = ScaffoldMessenger.maybeOf(context);
              if (messenger != null && messenger.mounted) {
                messenger.showSnackBar(SnackBar(content: Text('Gabim: $msg')));
              }
            });

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Diçka shkoi keq.'),
                  const SizedBox(height: 8),
                  FilledButton.icon(
                    onPressed: _retry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Provo përsëri'),
                  ),
                ],
              ),
            );
          }

          // DATA
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, i) {
              final u = users[i];
              return ListTile(
                leading: CircleAvatar(child: Text(u.name.isNotEmpty ? u.name[0] : '?')),
                title: Text(u.name),
                subtitle: Text(u.email),
                trailing: const Icon(Icons.chevron_right),
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

/// Faqja e detajeve
class UserDetailPage extends StatelessWidget {
  final User user;
  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _row('Emri', user.name),
                const Divider(),
                _row('Email', user.email),
                const Divider(),
                _row('Telefon', user.phone),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
        Expanded(child: Text(value)),
      ],
    );
  }
}
