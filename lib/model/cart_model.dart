// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());


class Cart {
  final String id;
  final String user;
  final List<Product> products;

  Cart({
    required this.id,
    required this.user,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["_id"],
    user: json["user"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  final String product;
  final int amount;
  final String id;

  Product({
    required this.product,
    required this.amount,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    product: json["product"],
    amount: json["amount"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "amount": amount,
    "_id": id,
  };
}
