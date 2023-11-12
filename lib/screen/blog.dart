import 'package:flutter/material.dart';
import 'package:k10_shopapp/service/new_service.dart';

import '../model/news.model.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool isLoading = false;
  List<New> news = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final getData = await newService.fetchNew();
      if (getData != null) {
        setState(() {
          news = getData;
          isLoading = true;
        });
      }
    } catch (e) {
      print("Lỗi rồi........$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  final blog = news[index];
                  return BlogCard(
                    imageUrl: blog.imgMain,
                    description: blog.title,
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String description;

  BlogCard({required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8), // Add margin to the card
      elevation: 4, // Add elevation for a shadow effect
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
