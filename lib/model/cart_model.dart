// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Cart> categoryFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String categoryToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  final String idProduct;
  final String image;
  final String name;
  final int price;
  final int quantity;
  final String userId;
  bool isSelected;
  TextEditingController quantityController;

  Cart({
    required this.idProduct,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.userId,
    this.isSelected = false,
  }) : quantityController = TextEditingController();

  Cart copyWith({
    String? idProduct,
    String? userId,
    String? image,
    int? quantity,
    int? price,
    String? name,
  }) {
    return Cart(
      idProduct: idProduct ?? this.idProduct,
      userId: userId ?? this.userId,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      name: name ?? this.name,
    );
  }

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        idProduct: json["idProduct"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        userId: json["userId"],
        isSelected: json['isSelected'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "image": image,
        "name": name,
        "price": price,
        "quantity": quantity,
        "userId": userId,
        'isSelected': isSelected,
      };
}
