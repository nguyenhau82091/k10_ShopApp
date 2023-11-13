import 'dart:io';

import 'package:k10_shopapp/model/cart_model.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';

class CartService {
  static Future<List<Cart>> addCart(String product, String user, String token) async {
    List<Cart> cart = [];
    var url = Uri.parse(API_CART);
    try {
      final response = await http.post(url, body: {
        "product": product,
        "user": user,
      }, headers: {
        HttpHeaders.authorizationHeader: '${token}'
      });
      print("product...............$product");
      print("user...............$user");
      if (response.statusCode == 201) {
         print("Add cart thành công");
      }
      return cart;
    } catch (e) {
      print("Lỗi.............$e");
      return cart;
    }
  }
}
