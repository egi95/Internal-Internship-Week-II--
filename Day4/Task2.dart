import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostsScreen(),
    );
  }
}

class PostsScreen extends StatefulWidget {
  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<dynamic>> _postsFuture;

  // Merr të dhënat nga API
  Future<List<dynamic>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gabim gjatë marrjes së postimeve!');
    }
  }

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  // Funksion për rifreskim manual
  void _refreshPosts() {
    setState(() {
      _postsFuture = fetchPosts();
    });
  }

  // Shfaq SnackBar në rast gabimi
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
        title: Text('Postimet'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshPosts, // Rifreskim me butonin e AppBar-it
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          // Loading i dukshëm
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Nëse ka gabim
          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showErrorSnackBar('Gabim gjatë ngarkimit të postimeve!');
            });
            return Center(child: Text('Gabim! Kontrollo lidhjen.'));
          }

          // Nëse ka të dhëna
          if (snapshot.hasData) {
            final posts = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async {
                _refreshPosts();
                await Future.delayed(Duration(milliseconds: 500));
              },
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post['title']),
                    subtitle: Text('Post ID: ${post['id']}'),
                  );
                },
              ),
            );
          }

          // Nëse nuk ka asgjë
          return Center(child: Text('Nuk ka të dhëna.'));
        },
      ),
    );
  }
}

