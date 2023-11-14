import 'package:flutter/material.dart';
import 'package:k10_shopapp/model/product_model.dart';

import '../widget/customToast.dart';
import '../widget/my_textInput.dart';

import '../service/order_service.dart';

enum SingingCharacter { lafayette, jefferson }

class OrderScreen extends StatefulWidget {
  final Product product;

  const OrderScreen({Key? key, required this.product}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController saleController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.lafayette;
  int quantity = 1;
  int sale = 0;
  int total = 0;
  int price = 0;
  String nameProduct = "";
  int countTotal = 0;

  Future<void> create() async {
    String name = nameController.text;
    int phone = int.parse(phoneController.text);
    String email = emailController.text;
    String city = cityController.text;
    String district = districtController.text;
    String address = addressController.text;
    String paymentMethod = _character == SingingCharacter.lafayette
        ? 'Thanh toán khi nhận hàng'
        : 'Thanh toán online';
    String note = noteController.text;
    String sale = saleController.text;
    String userId = "655078c8be66b7c8af84f0e7";
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTUwNzhjOGJlNjZiN2M4YWY4NGYwZTciLCJlbWFpbCI6InZpbmhkZXYzMUBnbWFpbC5jb20iLCJpYXQiOjE2OTk4NzkwMzksImV4cCI6MTcwMjQ3MTAzOX0.4vsnADQrxCVPi9ps_dCDwoXOv6VbY99ZrpXSBFGv138";
    if (name.isEmpty ||
        phone == null ||
        email.isEmpty ||
        city.isEmpty ||
        district.isEmpty ||
        address.isEmpty) {
      showDialog<void>(
        context: context,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Thông Báo'),
            content: Text('Các trường không được để trống'),
            actions: <Widget>[
              TextButton(
                child: Text('Đóng'),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        },
      );
    }
    try {
      final createOrder = await orderService.createOrder(
          userId,
          email,
          name,
          total,
          city,
          district,
          address,
          paymentMethod,
          sale,
          phone,
          nameProduct,
          price,
          quantity,
          token);

      if (createOrder != null) {
        print("add cart thành công");
      }
    } catch (e) {
      print("Lỗi...........$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    price = widget.product.price;
    total = quantity * price;
    nameProduct = widget.product.name;
    countTotal = total - sale;
    print(countTotal);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffc89595),
          title: const Text(
            "Thanh Toán",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 700,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "Thông Tin Khách Hàng",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Họ Và Tên:",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextInput(
                                hintText: "Nhập họ tên..........",
                                controller: nameController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Số điện thoại:",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextInput(
                                hintText: "Nhập số điện thoại..........",
                                controller: phoneController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Email:",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextInput(
                                hintText: "Nhập email..........",
                                controller: emailController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 165,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Tỉnh/Thành Phố:",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        MyTextInput(
                                          hintText: "Nhập địa chỉ",
                                          controller: cityController,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 165,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Quận/Huyện:",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        MyTextInput(
                                          hintText: "Nhập địa chỉ",
                                          controller: districtController,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Địa chỉ:",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextInput(
                                hintText: "Nhập địa chỉ..........",
                                controller: addressController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ghi chú:",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextInput(
                                hintText: "Nhập ghi chú..........",
                                controller: noteController,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 180,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Phương thức thanh toán",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            title: const Text('Thanh toán khi nhận hàng'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.lafayette,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Thanh toán online'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.jefferson,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  CustomToast.showCenterShortToast(
                                      "Tính năng đang phát triển");
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Tóm tắt sản phẩm",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Image.network(
                                      widget.product.imgUrls[0],
                                      width: 135,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.product.name,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "Số lượng: $quantity",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        "Giá:${widget.product.price}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Container(
                                        height: 1,
                                        width: 120,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "Tổng tiền: $total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Phương thức thanh toán",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextInput(
                            hintText: "Nhập mã Khuyến mại",
                            controller: saleController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xffc89595),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Áp Dụng",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 400,
                    height: 225,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Tổng giá tiền",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "(" + quantity.toString() + "sản phẩm)",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    total.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Giảm giá",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    sale.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Cần Thanh toán",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(countTotal.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffc89595),
                                      )),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: create,
                            child: Container(
                              width: 400,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xffc89595),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "Thanh Toán",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
