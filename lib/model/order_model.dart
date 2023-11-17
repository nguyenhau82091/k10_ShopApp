class Order {
  String id;
  String user;
  String status;
  String nameReceiver;
  int totalPrice;
  String email;
  int phoneReceiver;
  String province;
  String district;
  String address;
  String paymentCode;
  List<OrderProduct> orderProducts;
  List<Product> products;
  DateTime? createdAt;
  DateTime? updatedAt;

  Order({
    required this.id,
    required this.user,
    required this.status,
    required this.nameReceiver,
    required this.totalPrice,
    required this.email,
    required this.phoneReceiver,
    required this.province,
    required this.district,
    required this.address,
    required this.paymentCode,
    required this.orderProducts,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      user: json['user'],
      status: json['status'],
      nameReceiver: json['nameReceiver'],
      totalPrice: json['totalPrice'],
      email: json['email'],
      phoneReceiver: json['phoneReceiver'],
      province: json['province'],
      district: json['district'],
      address: json['address'],
      paymentCode: json['paymentCode'],
      orderProducts: (json['orderProducts'] as List)
          .map((product) => OrderProduct.fromJson(product))
          .toList(),
      products: (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class OrderProduct {
  String id;
  String product;
  String order;
  int price;
  int amount;
  DateTime createdAt;
  DateTime updatedAt;

  OrderProduct({
    required this.id,
    required this.product,
    required this.order,
    required this.price,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      id: json['_id'],
      product: json['product'],
      order: json['order'],
      price: json['price'],
      amount: json['amount'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Product {
  String id;
  String status;
  String name;
  int amount;
  int price;
  List<String> imgUrls;
  String categoryCode;
  String mainUse;
  String slogan;
  String ingredient;
  String where;
  String license;
  String certificate;
  String commit;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
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
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      status: json['status'],
      name: json['name'],
      amount: json['amount'],
      price: json['price'],
      imgUrls: (json['imgUrls'] as List).cast<String>(),
      categoryCode: json['categoryCode'],
      mainUse: json['mainUse'],
      slogan: json['slogan'],
      ingredient: json['ingredient'],
      where: json['where'],
      license: json['license'],
      certificate: json['certificate'],
      commit: json['commit'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}