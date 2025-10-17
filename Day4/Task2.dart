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
      title: 'Posts List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostsPage(),
    );
  }
}

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<dynamic>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Gabim: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gabim gjatë marrjes së të dhënave: $e');
    }
  }

  void refreshData() {
    setState(() {
      _postsFuture = fetchPosts();
    });
  }

  void showRetrySnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gabim gjatë marrjes së të dhënave'),
        action: SnackBarAction(
          label: 'Provo sërish',
          onPressed: refreshData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Postimeve'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Rifresko',
            onPressed: refreshData,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showRetrySnackBar(context);
            });
            return Center(child: Text('Gabim në ngarkim.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nuk u gjetën postime.'));
          }

          final posts = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async => refreshData(),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: ListTile(
                    title: Text(
                      post['title'],
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      post['body'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
