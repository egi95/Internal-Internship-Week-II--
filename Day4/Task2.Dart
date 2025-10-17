import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Model për një postim
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = fetchPosts();
  }

  // Funksioni që merr të dhënat nga API
  Future<List<Post>> fetchPosts() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Gabim gjatë ngarkimit të posteve (${response.statusCode})');
    }
  }

  // Funksion për rifreskim
  void _refreshPosts() {
    setState(() {
      _futurePosts = fetchPosts();
    });
  }

  // Funksion për shfaqjen e SnackBar në rast gabimi
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Provo sërish',
          onPressed: _refreshPosts,
          textColor: Colors.yellow,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e Posteve'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshPosts,
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Gjatë ngarkimit
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Në rast gabimi
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showErrorSnackBar('Gabim gjatë marrjes së të dhënave');
            });
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 50),
                  const SizedBox(height: 10),
                  Text(snapshot.error.toString()),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _refreshPosts,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: const Text('Provo sërish'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Nëse s’ka të dhëna
            return const Center(child: Text('Nuk ka postime.'));
          } else {
            // Shfaqim listën e posteve
            final posts = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async {
                _refreshPosts();
              },
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        post.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text(post.id.toString()),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostsPage(),
  ));
}
