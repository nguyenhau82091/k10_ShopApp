import 'package:flutter/material.dart';

import '../model/cart_model.dart';
import '../service/cart_service.dart';
import '../service/saveUser_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isLoading = false;
  bool _isCheckbox = false;
  List<Cart> cart = List.empty(growable: true);
  TextEditingController quantityController = TextEditingController();

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
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
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
                      quantityController.text = carts.price.toString();
                      print(cart.length);
                      print(carts);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Row(
                            children: [
                              Checkbox(
                                  value: _isCheckbox,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isCheckbox = value!;
                                    });
                                  }),
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
                                          "${carts.quantity}",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: null,
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 30,
                                                )),
                                            Container(
                                              width: 20,
                                              height: 10,
                                              child: TextField(
                                                controller: quantityController,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {

                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 30,
                                                )),
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
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
