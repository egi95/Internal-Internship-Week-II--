import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<dynamic>> _postsFuture;

  // ===== FUNKSIONI QË MERR TË DHËNAT NGA API =====
  Future<List<dynamic>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Kthe listën e posteve të dekoduara nga JSON
      return jsonDecode(response.body);
    } else {
      throw Exception('Gabim gjatë marrjes së të dhënave (${response.statusCode})');
    }
  }

  // ===== RIFRESKON FUTURE =====
  void _refreshPosts() {
    setState(() {
      _postsFuture = fetchPosts();
    });
  }

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e Posteve'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshPosts,
            tooltip: 'Rifresko listën',
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          // ===== GJENDJA E NGARKIMIT =====
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ===== GJENDJA E GABIMIT =====
          else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Gabim gjatë marrjes së të dhënave.'),
                  action: SnackBarAction(
                    label: 'Provo sërish',
                    onPressed: _refreshPosts,
                  ),
                ),
              );
            });
            return const Center(child: Text('Gabim! Shtyp “Provo sërish” për të rifilluar.'));
          }

          // ===== GJENDJA KUR KA TË DHËNA =====
          else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${post['id']}')),
                  title: Text(post['title']),
                  subtitle: Text(post['body']),
                );
              },
            );
          }

          // ===== GJENDJA E PARAZGJEDHUR =====
          else {
            return const Center(child: Text('Nuk ka të dhëna.'));
          }
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostsScreen(),
  ));
}
