import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: PostsPage(),
  ));
}

class PostsPage extends StatefulWidget {
  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<dynamic>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim gjatë marrjes së të dhënave (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Gabim: $e');
    }
  }

  void retryFetch() {
    setState(() {
      futurePosts = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Posteve'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: retryFetch,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Gabim gjatë ngarkimit!'),
                  action: SnackBarAction(
                    label: 'Provo sërish',
                    onPressed: retryFetch,
                  ),
                ),
              );
            });
            return Center(child: Text('Gabim gjatë marrjes së të dhënave.'));
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
            return Center(child: Text('Asnjë postim për t’u shfaqur.'));
          }
        },
      ),
    );
  }
}
