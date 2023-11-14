import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:k10_shopapp/api/api.dart';

class CodePostScreen extends StatelessWidget {
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(API_NEW));
    if (response.statusCode == 201) {
      // If the server returns a 200 OK response, parse the JSON data
      Map<String, dynamic> data = json.decode(response.body);
      // Process the fetched data as needed
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code Post'),
        backgroundColor: Color(0XFFC89595),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
