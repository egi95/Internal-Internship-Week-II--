import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: PostsScreen()));
}

class PostsScreen extends StatefulWidget {
  @override
  State<PostsScreen> createState() {
    return _PostsScreenState();
  }
}

class _PostsScreenState extends State<PostsScreen> {
  Future? postsFuture;

  Future getPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gabim ne marrjen e te dhenave');
    }
  }

  @override
  void initState() {
    super.initState();
    postsFuture = getPosts();
  }

  void refreshPosts() {
    setState(() {
      postsFuture = getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista e Poste')),
      body: FutureBuilder(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } 
          else if (snapshot.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Gabim ne marrjen e te dhenave'),
                action: SnackBarAction(
                  label: 'Provo perseri',
                  onPressed: () {
                    refreshPosts();
                  },
                ),
              ),
            );
            return Center(child: Text('Gabim'));
          } 
          else if (snapshot.hasData) {
            var posts = snapshot.data;
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    refreshPosts();
                  },
                  child: Text('Refresh'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index]['title']),
                      );
                    },
                  ),
                ),
              ],
            );
          } 
          else {
            return Center(child: Text('Nuk ka te dhena'));
          }
        },
      ),
    );
  }
}
