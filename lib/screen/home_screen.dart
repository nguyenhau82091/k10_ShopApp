import 'package:flutter/material.dart';
import 'package:k10_shopapp/screen/chatpage.dart';
import 'package:k10_shopapp/widget/chat.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController _usernameController = TextEditingController();

  bool isLoading = false;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
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
            : const Center(
                child: CircularProgressIndicator(),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (context) => ChatProvider(),
                  child: ChatPage(
                    username: _usernameController.text.trim(),
                  ),
                ),
              ),
            );
          },
          backgroundColor: const Color(0xffc89595),
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
