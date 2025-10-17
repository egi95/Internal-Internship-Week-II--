Day 5 – Flutter Mini Project (Online App)

Ky shembull përmban:

3 faqe (HomePage, DetailPage, AboutPage)

http.get për marrjen e posteve nga API

FutureBuilder, SnackBar, Navigator.push

dizajn të pastër dhe funksional


  lib/
 ┣ main.dart
 ┣ home.dart
 ┣ detail.dart
 ┗ about.dart


  import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mini Project',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
      routes: {
        '/about': (context) => const AboutPage(),
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gabim gjatë ngarkimit të të dhënave!');
    }
  }

  void _refresh() {
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
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Gabim gjatë ngarkimit.'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _refresh,
                    child: const Text('Provo sërish'),
                  )
                ],
              ),
            );
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: const Icon(Icons.article),
                  title: Text(post['title']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: post['title'],
                          body: post['body'],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('Nuk ka të dhëna.'));
          }
        },
      ),
    );
  }
}



import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String body;

  const DetailPage({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detajet e Postit')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(body, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rreth aplikacionit')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Ky është mini-projekti i Day 5 për praktikën Flutter.\n\n'
            'Autori: [Vendos emrin tënd këtu]\n'
            'Qëllimi: Ushtrimi i GET, FutureBuilder dhe Navigator.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
