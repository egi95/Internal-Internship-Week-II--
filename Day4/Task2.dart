import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista e Posteve',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PostListScreen(),
    );
  }
}

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<List<dynamic>> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = fetchPosts();
  }

  // 🔹 Marrim postet nga API
  Future<List<dynamic>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gabim gjatë marrjes së postimeve");
    }
  }

  // 🔹 Rifreskojmë Future
  void refreshPosts() {
    setState(() {
      postsFuture = fetchPosts();
    });
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
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: postsFuture,
        builder: (context, snapshot) {
          // 1️⃣ Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2️⃣ Gabim
          else if (snapshot.hasError) {
            // Shfaq SnackBar me veprimin "Provo sërish"
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Gabim: ${snapshot.error}"),
                  action: SnackBarAction(
                    label: "Provo sërish",
                    onPressed: refreshPosts,
                  ),
                ),
              );
            });

            return Center(
              child: Text(
                "Gabim gjatë ngarkimit!",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // 3️⃣ Ka të dhëna
          else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async => refreshPosts(),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post['title']),
                    subtitle: Text("Post ID: ${post['id']}"),
                  );
                },
              ),
            );
          }

          return const Center(child: Text("Nuk ka të dhëna"));
        },
      ),
    );
  }
}
