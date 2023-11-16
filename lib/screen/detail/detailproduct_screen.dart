import 'package:flutter/material.dart';
import 'package:k10_shopapp/model/product_model.dart';
import '../../service/cart_service.dart';
import '../../service/saveUser_service.dart';
import '../../widget/customToast.dart';
import '../orderProduct_screen.dart';

class detailProduct extends StatelessWidget {
  final Product product;

  const detailProduct({Key? key, required this.product}) : super(key: key);

  Future<void> creatCart() async {
    final currentUser = await UserManager().getUser();
    final productst = product.id;
    final image = product.imgUrls[0];
    final price = product.price;
    final name = product.name;
    int quantity = 1;
    final user = currentUser!.id;
    bool productAdded = await CartService.checkItemCart(productst,user);
    if (productAdded) {
      return CustomToast.showCenterShortToast("Sản phẩm đã tồn tại");
    }
    CartService.addCart(productst, user, image, quantity, price, name);
    CustomToast.showCenterShortToast("Thêm thành công");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Image.asset(
                "assets/logo/logo.png",
                width: 70,
              ),
              backgroundColor: Color(0xffc89595),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffc89595),
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product.imgUrls[0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.imgUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffc89595),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  product.imgUrls[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 150,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style:
                              TextStyle(fontSize: 24, color: Color(0xffc89595)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${product.price}",
                          style:
                              TextStyle(fontSize: 24, color: Color(0xffc89595)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderProductScreen(
                                                product: product,
                                              )))
                                },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Color(0xffc89595), width: 1)),
                              child: Center(
                                child: Text(
                                  "Mua Ngay",
                                  style: TextStyle(
                                      color: Color(0xffc89595),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTap: creatCart,
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xffc89595),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "Thêm Vào Giỏ Hàng",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.network(
                        "https://jilgyungyi.vn/static/media/thuoc.796c7589ee97de94aee5.png")
                  ],
                ),
              ),
            )));
  }
}
