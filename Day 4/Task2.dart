import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostsPage(),
  ));
}

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<dynamic>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gabim gjatë marrjes së posteve (${response.statusCode})');
    }
  }

  void _refreshPosts() {
    setState(() {
      _postsFuture = fetchPosts();
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Provo sërish',
          onPressed: _refreshPosts,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e Posteve'),
        actions: [
          IconButton(
            onPressed: _refreshPosts,
            icon: const Icon(Icons.refresh),
            tooltip: 'Rifresko',
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading i dukshëm
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Gabim -> SnackBar me "Provo sërish"
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showErrorSnackBar('Gabim gjatë ngarkimit të të dhënave.');
            });
            return Center(
              child: ElevatedButton(
                onPressed: _refreshPosts,
                child: const Text('Provo sërish'),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nuk ka poste për t’u shfaqur.'));
          }

          // Të dhënat e marra me sukses
          final posts = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async => _refreshPosts(),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(
                    post['title'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  subtitle: Text('Post ID: ${post['id']}'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
