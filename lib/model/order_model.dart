// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  final String user;
  final String email;
  final String nameReceiver;
  final int totalPrice;
  final String province;
  final String district;
  final String address;
  final String paymentCode;
  final String promotionCode;
  final int phoneReceiver;
  final List<OrderProduct> orderProducts;

  Order({
    required this.user,
    required this.email,
    required this.nameReceiver,
    required this.totalPrice,
    required this.province,
    required this.district,
    required this.address,
    required this.paymentCode,
    required this.promotionCode,
    required this.phoneReceiver,
    required this.orderProducts,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    user: json["user"],
    email: json["email"],
    nameReceiver: json["nameReceiver"],
    totalPrice: json["totalPrice"],
    province: json["province"],
    district: json["district"],
    address: json["address"],
    paymentCode: json["paymentCode"],
    promotionCode: json["promotionCode"],
    phoneReceiver: json["phoneReceiver"],
    orderProducts: List<OrderProduct>.from(json["orderProducts"].map((x) => OrderProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
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
    "orderProducts": List<dynamic>.from(orderProducts.map((x) => x.toJson())),
  };
}

class OrderProduct {
  final String product;
  final int price;
  final int amount;

  OrderProduct({
    required this.product,
    required this.price,
    required this.amount,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
    product: json["product"],
    price: json["price"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "price": price,
    "amount": amount,
  };
}
