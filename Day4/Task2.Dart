import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  late Future<List<dynamic>> _postsFuture;

  // Funksioni që merr postet nga API
  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Nuk u mundësua marrja e të dhënave');
    }
  }

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  // Funksioni për rifreskim
  void _refresh() {
    setState(() {
      _postsFuture = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista e posteve'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading i dukshëm gjatë marrjes së të dhënave
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Në gabim, shfaq SnackBar me butonin "Provo sërish"
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Gabim gjatë marrjes së të dhënave'),
                  action: SnackBarAction(
                    label: 'Provo sërish',
                    onPressed: _refresh,
                  ),
                ),
              );
            });
            return const Center(child: Text('Gabim!'));
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            // Shfaq lista e titujve të posteve
            return RefreshIndicator(
              onRefresh: () async {
                _refresh();
                await Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index]['title']),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('Nuk ka të dhëna'));
          }
        },
      ),
    );
  }
}
