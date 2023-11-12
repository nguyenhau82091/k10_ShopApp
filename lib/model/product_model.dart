// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  final List<Datum> data;

  Product({
    required this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final String id;
  final Status status;
  final String name;
  final int amount;
  final int price;
  final List<String> imgUrls;
  final String categoryCode;
  final String mainUse;
  final String slogan;
  final String ingredient;
  final String where;
  final String license;
  final String certificate;
  final String commit;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final bool isShow;
  final dynamic deletedAt;

  Datum({
    required this.id,
    required this.status,
    required this.name,
    required this.amount,
    required this.price,
    required this.imgUrls,
    required this.categoryCode,
    required this.mainUse,
    required this.slogan,
    required this.ingredient,
    required this.where,
    required this.license,
    required this.certificate,
    required this.commit,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isShow,
    required this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    status: statusValues.map[json["status"]]!,
    name: json["name"],
    amount: json["amount"],
    price: json["price"],
    imgUrls: List<String>.from(json["imgUrls"].map((x) => x)),
    categoryCode: json["categoryCode"],
    mainUse: json["mainUse"],
    slogan: json["slogan"],
    ingredient: json["ingredient"],
    where: json["where"],
    license: json["license"],
    certificate: json["certificate"],
    commit: json["commit"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    isShow: json["isShow"],
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "status": statusValues.reverse[status],
    "name": name,
    "amount": amount,
    "price": price,
    "imgUrls": List<dynamic>.from(imgUrls.map((x) => x)),
    "categoryCode": categoryCode,
    "mainUse": mainUse,
    "slogan": slogan,
    "ingredient": ingredient,
    "where": where,
    "license": license,
    "certificate": certificate,
    "commit": commit,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "isShow": isShow,
    "deletedAt": deletedAt,
  };
}

enum Status {
  ACTIVE
}

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
