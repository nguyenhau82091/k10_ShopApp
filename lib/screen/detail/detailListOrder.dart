import 'package:flutter/material.dart';
import 'package:k10_shopapp/model/order_model.dart';

class DetailOrder extends StatelessWidget {
  final Order order;

  const DetailOrder({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi Tiết Đơn Hàng"),
        backgroundColor: Color(0xffc89595),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tên Khách Hàng: ${order.nameReceiver}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Email Khách Hàng: ${order.email}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "phone Khách Hàng: ${order.phoneReceiver}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Địa chỉ Khách Hàng: ${order.address}, ${order.district}, ${order.province}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 2,
              color: Color(0xffc89595),
            ),
            SizedBox(height: 20),
            Text(
              "Danh sách sản phẩm:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: order.products.length,
                itemBuilder: (context, index) {
                  final product = order.products[index];
                  return ListTile(
                    title: Text("Tên sản phẩm: ${product.name}"),
                    subtitle: Text("Giá: ${product.price}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
