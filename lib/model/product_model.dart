// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> categoryFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String categoryToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  final String id;
  final Status status;
  final String name;

  // final int amount;
  final int price;
  final List<String> imgUrls;

  // final String categoryCode;
  final String mainUse;
  final String slogan;

  // final String ingredient;
  // final String where;
  // final String license;
  // final String certificate;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  // final int v;

  Product({
    required this.id,
    required this.status,
    required this.name,
    // required this.amount,
    required this.price,
    required this.imgUrls,
    // required this.categoryCode,
    required this.mainUse,
    required this.slogan,
    // required this.ingredient,
    // required this.where,
    // required this.license,
    // required this.certificate,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        status: statusValues.map[json["status"]]!,
        name: json["name"],
        // amount: json["amount"],
        price: json["price"],
        imgUrls: List<String>.from(json["imgUrls"].map((x) => x)),
        // categoryCode: json["categoryCode"],
        mainUse: json["mainUse"],
        slogan: json["slogan"],
        // ingredient: json["ingredient"],
        // where: json["where"],
        // license: json["license"],
        // certificate: json["certificate"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": statusValues.reverse[status],
        "name": name,
        // "amount": amount,
        "price": price,
        "imgUrls": List<dynamic>.from(imgUrls.map((x) => x)),
        // "categoryCode": categoryCode,
        "mainUse": mainUse,
        "slogan": slogan,
        // "ingredient": ingredient,
        // "where": where,
        // "license": license,
        // "certificate": certificate,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        // "__v": v,
      };
}

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
