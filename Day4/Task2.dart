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

  Future<List<dynamic>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gabim gjatë marrjes së të dhënave');
    }
  }

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  void _refreshPosts() {
    setState(() {
      _postsFuture = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e Poste'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshPosts,
          )
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Gabim gjatë ngarkimit të të dhënave'),
                  action: SnackBarAction(
                    label: 'Provo sërish',
                    onPressed: _refreshPosts,
                  ),
                ),
              );
            });
            return const Center(child: Text('Gabim gjatë ngarkimit.'));
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post['title']),
                );
              },
            );
          } else {
            return const Center(child: Text('Nuk ka të dhëna.'));
          }
        },
      ),
    );
  }
}
