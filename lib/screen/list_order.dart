import 'package:flutter/material.dart';
import 'package:k10_shopapp/widget/item_product.dart';

import '../model/order_model.dart';
import '../service/order_service.dart';
import '../service/product_service.dart';
import '../service/saveUser_service.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({super.key});

  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  bool isLoading = false;
  List<Order> order = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final user = UserManager().getUser();
    final userId = user!.id;
    final token = user!.token;
    try {
      final fetchData = await OrderService.fetchData(userId, token);
      if (fetchData != null) {
        setState(() {
          order = fetchData;
          isLoading = true;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List Order"),
          backgroundColor: Color(0xffc89595),
        ),
        body: isLoading
            ? ListView.builder(
                itemCount: order.length,
                itemBuilder: (context, index) {
                  final product = order[index];
                  return GestureDetector(
                    child: Card(
                      child: ListTile(
                        title: Text("${product.orderProducts}"),
                      ),
                    ),
                  );
                })
            : Center(
                child: Center(
                  child: Image.asset("assets/image/Loading-unscreen.gif",width: 100,),
                ),
              ));
  }
}
