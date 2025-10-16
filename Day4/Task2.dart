import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Task2 extends StatefulWidget {
  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  late Future<List<dynamic>> posts;

  Future<List<dynamic>> fetchPosts() async {
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  void refreshPosts() {
    setState(() {
      posts = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: FutureBuilder<List<dynamic>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error loading posts'),
                  action: SnackBarAction(
                    label: 'Provo serish',
                    onPressed: refreshPosts,
                  ),
                ),
              );
            });
            return Center(child: Text('Gabim gjate marrjes se te dhenave'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(data[index]['title']));
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshPosts,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
