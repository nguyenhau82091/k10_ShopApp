// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

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

  Cart({
    required this.idProduct,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.userId,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        idProduct: json["idProduct"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "image": image,
        "name": name,
        "price": price,
        "quantity": quantity,
        "userId": userId,
      };
}
