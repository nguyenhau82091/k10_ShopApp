import 'dart:convert';

import '../api/api.dart';
import '../model/news.model.dart';
import 'package:http/http.dart' as http;

class newService {
  static Future<List<New>> fetchNew() async {
    var url = Uri.parse(API_NEWS);
    List<New> news = [];
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List<dynamic> productListJson = jsonResponse['data'];
        print(productListJson);
        return productListJson.map((data) => New.fromJson(data)).toList();
      }
      return news;
    } catch (e) {
      print("Lỗi Kìa...............$e");
      return news;
    }
  }
}
