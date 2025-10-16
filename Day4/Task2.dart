dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0

lib/main.dart
import 'package:flutter/material.dart';
import 'posts_page.dart';

void main() {
  runApp(const PostsApp());
}

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts with Retry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const PostsPage(),
    );
  }
}

lib/posts_page.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final int id;
  final String title;
  Post({required this.id, required this.title});

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(id: json['id'] as int, title: (json['title'] ?? '').toString());
}

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      final res = await http.get(uri);

      if (res.statusCode != 200) {
        throw Exception('Server returned ${res.statusCode}');
      }

      final List data = jsonDecode(res.body) as List;
      return data
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(growable: false);
    } catch (e) {
      // Shfaq SnackBar me veprim "Provo sërish"
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gabim gjatë marrjes së të dhënave: $e'),
            action: SnackBarAction(
              label: 'Provo sërish',
              onPressed: _retry,
            ),
          ),
        );
      });
      rethrow; // lejo FutureBuilder të kalojë në gjendjen error
    }
  }

  void _retry() {
    setState(() {
      _futurePosts = _fetchPosts();
    });
  }

  void _refresh() {
    _retry();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          // 1) LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2) ERROR
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Diçka shkoi keq.'),
                  const SizedBox(height: 8),
                  Text(
                    '${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: _retry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Provo sërish'),
                  ),
                ],
              ),
            );
          }

          // 3) DATA
          final posts = snapshot.data ?? const <Post>[];
          if (posts.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Asnjë post për të shfaqur.'),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: _refresh,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Rifresko'),
                  ),
                ],
              ),
            );
          }

          // Lista e titujve
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: posts.length,
            separatorBuilder: (_, __) => const Divider(height: 0),
            itemBuilder: (context, i) {
              final p = posts[i];
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${p.id}'),
                ),
                title: Text(p.title),
                subtitle: const Text('jsonplaceholder.typicode.com'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // (opsionale) mund të shtosh një SnackBar në tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Zgjodhe post #${p.id}')),
                  );
                },
              );
            },
          );
        },
      ),
      // Buton Refresh edhe si FAB nëse të pëlqen
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _refresh,
        icon: const Icon(Icons.refresh),
        label: const Text('Refresh'),
      ),
    );
  }
}
