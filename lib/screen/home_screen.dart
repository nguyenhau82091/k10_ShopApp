import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../service/product_service.dart';
import '../widget/item_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<Product> products = [];

  Future<void> getData() async {
    try {
      // Assuming productService is an instance of your ProductService class
      final fetchData = await productService.fetchData();
      if (fetchData != null) {
        setState(() {
          products = fetchData;
          print(products);
          isLoading = true;
        });
      }
    } catch (error) {
      // Handle any errors that occur during the fetchData process
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: (context, index) {});
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add functionality for FloatingActionButton onPressed
          },
          backgroundColor: Color(0xffc89595),
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
