import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api/api.dart';

class OrderService {
   // Replace with your actual API base URL

   static Future<void> createOrder(
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
      List<String> productIds, // Change the type if necessary
      int price,
      int amount,
      String token,
      ) async {
    final url = Uri.parse(API_ORDER); // Replace with your actual API endpoint for creating orders

    final orderProducts = productIds.map((productId) {
      return {
        "product": productId,
        "price": price,
        "amount": amount,
      };
    }).toList();

    final Map<String, dynamic> requestBody = {
      "user": user,
      "email": email,
      "nameReceiver": nameReceiver,
      "totalPrice": totalPrice,
      "province": province,
      "district": district,
      "address": address,
      "paymentCode": paymentCode,
      "promotionCode": promotionCode,
      "phoneReceiver": phoneReceiver,
      "orderProducts": orderProducts,
    };
print(orderProducts);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        // Order created successfully
        print('Order created successfully');
      } else {
        // Handle error
        print('Failed to create order. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating order: $e');
      // Handle error
    }
  }
}