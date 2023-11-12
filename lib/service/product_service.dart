import 'dart:convert';

import '../api/api.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<Product>> fetchData() async {
    final List<Product> products = [];
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var uri = Uri.parse(API_PRODUCT);
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List<dynamic> productListJson = jsonResponse['data']['data'];
        return productListJson.map((data) => Product.fromJson(data)).toList();
      }
      return products;
    } catch (e) {
      print('Error fetching data: $e');
      return products;
    }
  }
}
