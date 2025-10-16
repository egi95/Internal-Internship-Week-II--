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
      debugShowCheckedModeBanner: false,
      title: 'Task 2 - Lista e Posteve me Rifreskim',
      home: PostsPage(),
    );
  }
}

class PostsPage extends StatefulWidget {
  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<dynamic>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  // Funksioni që merr postet nga API
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
      throw Exception('Nuk u morën të dhënat. Kontrollo lidhjen.');
    }
  }

  // Funksioni për rifreskim
  void _refresh() {
    setState(() {
      _postsFuture = fetchPosts();
    });
  }

  // Funksioni për shfaqje të gabimit me buton Retry
  void _showRetrySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gabim gjatë marrjes së të dhënave'),
        action: SnackBarAction(
          label: 'Provo sërish',
          onPressed: _refresh,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postet nga API'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refresh,
          )
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          // Gjendja: Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Gjendja: Error
          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showRetrySnackBar();
            });
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                  SizedBox(height: 10),
                  Text(
                    'Gabim gjatë marrjes së të dhënave.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _refresh,
                    child: Text('Provo sërish'),
                  ),
                ],
              ),
            );
          }

          // Gjendja: Data
          if (snapshot.hasData) {
            final posts = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async {
                _refresh();
              },
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          post['id'].toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        post['title'],
                        style: TextStyle(fontWeight: FontWeight.bold),
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
          }

          // Nëse nuk ka të dhëna
          return Center(child: Text('Asnjë post nuk është i disponueshëm.'));
        },
      ),
    );
  }
}
