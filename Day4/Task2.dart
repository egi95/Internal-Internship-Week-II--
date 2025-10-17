import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internship Day 4 - Task 2',
      home: PostListPage(),
    );
  }
}

// ------------------------------------------
// MAIN PAGE (List of Posts + Refresh Button)
// ------------------------------------------
class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  late Future<List<dynamic>> _postsFuture;

  // Fetch posts from API
  Future<List<dynamic>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim: ${response.statusCode}');
      }
    } catch (e) {
      // Show retry SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Gabim gjatë marrjes së të dhënave.'),
          action: SnackBarAction(
            label: 'Provo sërish',
            onPressed: () {
              setState(() {
                _postsFuture = fetchPosts();
              });
            },
          ),
        ),
      );
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  // Manual refresh button
  void _refreshPosts() {
    setState(() {
      _postsFuture = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista e Posteve"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Rifresko',
            onPressed: _refreshPosts,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show simple error text (SnackBar already shown)
            return const Center(
              child: Text(
                'Gabim gjatë ngarkimit!',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async => _refreshPosts(),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.article, color: Colors.blue),
                      title: Text(
                        post['title'],
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text("Post ID: ${post['id']}"),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('Asnjë postim për t’u shfaqur.'));
          }
        },
      ),
    );
  }
}
