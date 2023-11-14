import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../service/product_service.dart';
import '../widget/item_product.dart';
import 'detail/detailproduct_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  bool isLoading = false;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getData();
  }
  
  Future<void> getData() async {
    try {
      final fetchData = await ProductService.fetchData();
      if (fetchData != null) {
        setState(() {
          products = fetchData;
          isLoading = true;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ItemProduct(
                    title: product.name,
                    slogan: product.slogan,
                    mainUse: product.mainUse,
                    urls: product.imgUrls,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detailProduct(
                                  product: product,
                                ))),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/chat');
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
