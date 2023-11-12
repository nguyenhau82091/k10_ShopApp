import 'dart:convert';

import '../api/api.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class productService {
  static Future<List<Product>> fetchData() async {
    final List<Product> products = [];

    try {
      var uri = Uri.parse(API_PRODUCT);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data')) {
          print("voo");
          final product = jsonResponse['data'];
          print("aaaaaa");
          return product.map((e) => Product.fromJson(e)).toList();
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return products;
  }
}
