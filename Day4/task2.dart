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
      title: 'Task 2 – Lista e Poste me Rifreskim',
      debugShowCheckedModeBanner: false,
      home: PostListScreen(),
    );
  }
}

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<List<dynamic>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gabim gjatë ngarkimit të posteve (${response.statusCode})');
    }
  }

  void _refreshPosts() {
    setState(() {
      _futurePosts = fetchPosts();
    });
  }

  void _showErrorSnackBar(Object error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gabim: $error'),
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
        title: Text("Lista e Poste"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Rifresko',
            onPressed: _refreshPosts,
          )
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Gjendja gjatë ngarkimit
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Në rast gabimi
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showErrorSnackBar(snapshot.error!);
            });
            return Center(
              child: Text(
                'Gabim gjatë ngarkimit të të dhënave.\nKliko “Provo sërish” për të rifilluar.',
                textAlign: TextAlign.center,
              ),
            );
          } else if (snapshot.hasData) {
            // Kur kemi të dhëna
            final posts = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async => _refreshPosts(),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${post['id']}')),
                    title: Text(
                      post['title'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(post['body']),
                  );
                },
              ),
            );
          } else {
            // Kur s’ka asgjë për t’u shfaqur
            return Center(child: Text('Nuk ka të dhëna për t’u shfaqur.'));
          }
        },
      ),
    );
  }
}
