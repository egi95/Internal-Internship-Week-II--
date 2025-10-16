import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<dynamic>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  // 🔹 Funksioni që merr të dhënat nga API
  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gabim gjatë marrjes së të dhënave.');
    }
  }

  // 🔹 Funksioni për të rifreskuar (rifetcho)
  void _refreshPosts() {
    setState(() {
      _postsFuture = fetchPosts();
    });
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
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          // 🔹 Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 🔹 Error state
          else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Gabim gjatë marrjes së të dhënave!'),
                  action: SnackBarAction(
                    label: 'Provo sërish',
                    onPressed: _refreshPosts,
                  ),
                ),
              );
            });
            return const Center(child: Text('Nuk u arrit të merren postet.'));
          }

          // 🔹 Data state
          else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async => _refreshPosts(),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${post['id']}')),
                    title: Text(post['title']),
                  );
                },
              ),
            );
          }

          // 🔹 Në rast të rrallë pa asnjë gjendje
          return const Center(child: Text('Asnjë post për t’u shfaqur.'));
        },
      ),
    );
  }
}

