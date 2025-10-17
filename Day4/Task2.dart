import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(home: PostListPage()));
}
class PostListPage extends StatefulWidget {
  const PostListPage({super.key});
  @override
  State<PostListPage> createState() => _PostListPageState();
}
class _PostListPageState extends State<PostListPage> {
  late Future<List<dynamic>> _postsFuture;
  Future<List<dynamic>> getPosts() async {
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Error loading posts');
  }
  @override
  void initState() {
    super.initState();
    _postsFuture = getPosts();
  }
  void refreshPosts() {
    setState(() {
      _postsFuture = getPosts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refreshPosts,
          ),
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
                  content: const Text('Failed to load posts'),
                  action: SnackBarAction(
                    label: 'Try again',
                    onPressed: refreshPosts,
                  ),
                ),
              );
            });
            return const Center(child: Text('Error loading posts'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, i) {
                final p = posts[i];
                return ListTile(title: Text(p['title']));
              },
            );
          }
        },
      ),
    );
  }
}
