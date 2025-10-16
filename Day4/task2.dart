main.dart

import 'package:flutter/material.dart';
import 'posts_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Posts App',
    home: PostsScreen(),
  ));
}


posts_screen.dart


  import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<dynamic>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    try {
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ka ndodhur gabim: $e');
    }
  }

  void refreshPosts() {
    setState(() {
      posts = fetchPosts();
    });
  }

  void showRetrySnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gabim gjatë ngarkimit!'),
        action: SnackBarAction(
          label: 'Provo sërish',
          onPressed: refreshPosts,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Posteve'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: refreshPosts,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Shfaq SnackBar në gabim
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showRetrySnackBar(context);
            });
            return Center(child: Text('Ka ndodhur gabim!'));
          } else if (snapshot.hasData) {
            var postList = snapshot.data!;
            return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                var post = postList[index];
                return ListTile(
                  title: Text(post['title']),
                );
              },
            );
          } else {
            return Center(child: Text('Nuk ka të dhëna'));
          }
        },
      ),
    );
  }
}
