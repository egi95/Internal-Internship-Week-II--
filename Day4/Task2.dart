import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MaterialApp(home: PostsPage()));

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  Future<List> fetchPosts() async {
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (res.statusCode == 200) return json.decode(res.body);
    throw Exception('Gabim në ngarkim');
  }

  void refresh() => setState(() => posts = fetchPosts());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postimet'),
        actions: [IconButton(onPressed: refresh, icon: const Icon(Icons.refresh))],
      ),
      body: FutureBuilder<List>(
        future: posts,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snap.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Gabim gjatë ngarkimit'),
                action: SnackBarAction(label: 'Provo sërish', onPressed: refresh),
              ),
            );
            return const Center(child: Text('Gabim!'));
          } else {
            final data = snap.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, i) => ListTile(title: Text(data[i]['title'])),
            );
          }
        },
      ),
    );
  }
}

