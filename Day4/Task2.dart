Detyra:
main.dart

  import 'package:flutter/material.dart';
import 'posts_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Lista e Posteve',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: PostsPage(),
  ));
}




posts_page.dart

  import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsPage extends StatefulWidget {
  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<dynamic>> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = fetchPosts();
  }

 
  Future<List<dynamic>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim gjatë marrjes së posteve (${response.statusCode})');
      }
    } catch (e) {
      // Kthehet exception që kapet në FutureBuilder
      throw Exception('Gabim në lidhje: $e');
    }
  }

 
  void refreshPosts() {
    setState(() {
      postsFuture = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postet nga JSONPlaceholder'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: refreshPosts,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
           
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Gabim gjatë marrjes së të dhënave!'),
                  action: SnackBarAction(
                    label: 'Provo sërish',
                    onPressed: refreshPosts,
                  ),
                ),
              );
            });
            return Center(
              child: Text(
                'Gabim: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          } else if (snapshot.hasData) {
          
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(post['id'].toString()),
                  ),
                  title: Text(
                    post['title'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    post['body'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Nuk ka të dhëna.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: refreshPosts,
        label: Text('Rifresko'),
        icon: Icon(Icons.refresh),
      ),
    );
  }
}
