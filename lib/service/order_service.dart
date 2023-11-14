import 'dart:convert';
import 'dart:io';

import '../api/api.dart';
import '../model/order_model.dart';
import 'package:http/http.dart' as http;

class orderService {
  static Future<List<Order>> createOrder(
      String user,
      String email,
      String nameReceiver,
      int totalPrice,
      String province,
      String district,
      String address,
      String paymentCode,
      String promotionCode,
      int phoneReceiver,
      String product,
      int price,
      int amount,
      String token,
      ) async {
    List<Order> orders = [];
    final url = Uri.parse(API_ORDER);

    try {
      final createOrder = await http.post(url, body: {
        "user": user,
        "email": email,
        "nameReceiver": nameReceiver,
        "totalPrice": totalPrice.toString(),
        "province": province,
        "district": district,
        "address": address,
        "paymentCode": paymentCode,
        "promotionCode": promotionCode,
        "phoneReceiver": phoneReceiver.toString(),
        "product": product,
        "price": price.toString(),
        "amount": amount.toString(),
      }, headers: {
        HttpHeaders.authorizationHeader: '${token}',
      });

      if (createOrder.statusCode == 201) {
        // Parse the response body and create Order objects
        // Add the created orders to the orders list
        // Example: Assuming your API returns a JSON array of orders
        print("Add order thành công");
      }

      return orders;
    } catch (e) {
      print("Lỗi.................$e");
      return orders;
    }
  }
}
