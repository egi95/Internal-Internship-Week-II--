import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostListPage(),
  ));
}

class PostListPage extends StatefulWidget {
  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  late Future<List<dynamic>> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    try {
      final response =
          await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim gjatë ngarkimit (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Nuk u arrit të merren të dhënat: $e');
    }
  }

  void refreshPosts() {
    setState(() {
      postsFuture = fetchPosts();
    });
  }

  void showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Gabim gjatë marrjes së të dhënave'),
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
        title: const Text('Lista e Posteve'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refreshPosts,
          )
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showErrorSnackBar(context);
            });
            return const Center(child: Text('Gabim gjatë ngarkimit.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Asnjë postim nuk u gjet.'));
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post['title']),
                subtitle: Text('ID: ${post['id']}'),
                leading: const Icon(Icons.article_outlined),
              );
            },
          );
        },
      ),
    );
  }
}
