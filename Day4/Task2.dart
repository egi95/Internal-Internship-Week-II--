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
      title: 'Day 4 - Task 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostsScreen(),
    );
  }
}

class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<Post>> _futurePosts;

  Future<List<Post>> _fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    // Simulojmë një gabim për testim (heqni këtë pjesë në prodhim)
    // if (DateTime.now().second % 3 == 0) {
    //   throw Exception('Gabim i simuluar për testim');
    // }

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Dështoi të ngarkojë postimet. Status: ${response.statusCode}');
    }
  }

  void _refreshPosts() {
    setState(() {
      _futurePosts = _fetchPosts();
    });
  }

  @override
  void initState() {
    super.initState();
    _futurePosts = _fetchPosts();
  }

  void _showErrorSnackBar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gabim: $error'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Provo sërish',
          textColor: Colors.white,
          onPressed: () {
            _refreshPosts();
          },
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
            onPressed: _refreshPosts,
            tooltip: 'Rifresko',
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          // Gjendja e loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Duke ngarkuar postimet...'),
                ],
              ),
            );
          }

          // Gjendja e gabimit
          if (snapshot.hasError) {
            // Shfaq SnackBar pasi të jetë ndërtuar widget
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              _showErrorSnackBar(snapshot.error.toString());
            });

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 64),
                  SizedBox(height: 20),
                  Text(
                    'Ndodhi një gabim',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _refreshPosts,
                    icon: Icon(Icons.refresh),
                    label: Text('Provo përsëri'),
                  ),
                ],
              ),
            );
          }

          // Gjendja e suksesit - shfaqja e të dhënave
          final posts = snapshot.data!;
          return Column(
            children: [
              // Header me numrin e postimeve
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total postime: ${posts.length}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    Text(
                      'ID e fundit: ${posts.last.id}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[600],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Lista e postimeve
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _getColorForId(post.id),
                          child: Text(
                            '${post.id}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          post.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          post.body.length > 100 
                              ? '${post.body.substring(0, 100)}...' 
                              : post.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshPosts,
        child: Icon(Icons.refresh),
        tooltip: 'Rifresko postimet',
      ),
    );
  }

  // Metodë ndihmëse për ngjyra të ndryshme bazuar në ID
  Color _getColorForId(int id) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
    ];
    return colors[id % colors.length];
  }
}
