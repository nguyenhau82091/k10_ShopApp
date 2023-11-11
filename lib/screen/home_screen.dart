import 'package:flutter/material.dart';

import '../widget/item_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          width: 70,
        ),
        backgroundColor: Color(0xffc89595),
      ),
      body: ListView(
        children: [
          ItemProduct(),
          ItemProduct(),
          ItemProduct(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Color(0xffc89595),
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    ));
  }
}
