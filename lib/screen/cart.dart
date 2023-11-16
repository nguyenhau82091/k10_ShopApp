import 'package:flutter/material.dart';

import '../model/cart_model.dart';
import '../service/cart_service.dart';
import '../service/saveUser_service.dart';
import '../widget/customToast.dart';
import 'oder_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isLoading = false;
  List<Cart> cart = List.empty(growable: true);
  TextEditingController quantityController = TextEditingController();
  int totalAmount = 0;
  List<Cart> selectedItems = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final user = await UserManager().getUser();
    String userId = user!.id;
    try {
      final fetchData = await CartService.getCart(userId);
      if (fetchData != null) {
        setState(() {
          cart = fetchData;
          _isLoading = true;
          for (var item in cart) {
            item.quantityController =
                TextEditingController(text: item.quantity.toString());
          }
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void updateTotalAmount() {
    totalAmount = cart.fold(0, (sum, item) {
      if (item.isSelected) {
        selectedItems.add(item); // Thêm sản phẩm được chọn vào danh sách
        return sum + (item.price * item.quantity);
      }
      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: _isLoading
            ? Scaffold(
                body: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final carts = cart[index];
                      quantityController.text = carts.quantity.toString();
                      print("aaaaaaaaa........${carts.quantity}");
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Row(
                            children: [
                              Checkbox(
                                value: carts.isSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    carts.isSelected = value ?? false;
                                    updateTotalAmount();
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Image.network(
                                      carts.image,
                                      width: 100,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          carts.name,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          "${carts.price}",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: Colors.grey,
                                                  )),
                                              child: GestureDetector(
                                                  onTap: () async {
                                                    int quantity = int.parse(
                                                        quantityController
                                                            .text);
                                                    quantity++;
                                                    quantityController.text =
                                                        quantity.toString();

                                                    try {
                                                      final fetchData =
                                                          await CartService
                                                              .updateCartQuantity(
                                                                  carts
                                                                      .idProduct,
                                                                  quantity);
                                                      if (fetchData != null) {
                                                        setState(() {
                                                          cart = fetchData;
                                                          _isLoading = true;
                                                        });
                                                      }
                                                    } catch (error) {
                                                      print(
                                                          'Error fetching data: $error');
                                                    }
                                                    getData();
                                                  },
                                                  child: Image.asset(
                                                      "assets/image/add.png")),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 2)),
                                              child: TextFormField(
                                                controller:
                                                    carts.quantityController,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: Colors.grey,
                                                  )),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  int quantity = int.parse(
                                                      quantityController.text);
                                                  if (quantity > 1) {
                                                    quantity--;
                                                  }
                                                  quantityController.text =
                                                      quantity.toString();
                                                  try {
                                                    final fetchData =
                                                        await CartService
                                                            .updateCartQuantity(
                                                                carts.idProduct,
                                                                quantity);
                                                    if (fetchData != null) {
                                                      setState(() {
                                                        cart = fetchData;
                                                        _isLoading = true;
                                                      });
                                                    }
                                                  } catch (error) {
                                                    print(
                                                        'Error fetching data: $error');
                                                  }
                                                  getData();
                                                },
                                                child: Image.asset(
                                                    "assets/image/remove.png"),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                bottomNavigationBar: BottomAppBar(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Checkbox(
                      value: cart.every((item) => item.isSelected),
                      onChanged: (bool? value) {
                        setState(() {
                          for (final item in cart) {
                            item.isSelected = value ?? false;
                          }
                          updateTotalAmount();
                        });
                      },
                    ),
                    Text("Tất Cả"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Cần Thanh Toán:$totalAmount"),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        color: Color(0xffc89595),
                        child: GestureDetector(
                          onTap: () => {
                            if (selectedItems.isNotEmpty)
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OrderScreen(cart: selectedItems),
                                  ),
                                )
                              }
                            else
                              {
                                // Hiển thị thông báo nếu không có sản phẩm nào được chọn

                                CustomToast.showCenterShortToast(
                                    "Vui lòng chọn ít nhất một sản phẩm để mua hàng.")
                              }
                          },
                          child: Text(
                            "Mua Hàng",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                )),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
