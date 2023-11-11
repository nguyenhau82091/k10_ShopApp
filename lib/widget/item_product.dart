import 'package:flutter/material.dart';

import '../screen/detailproduct_screen.dart';

class ItemProduct extends StatefulWidget {
  final String? title;
  final String? slogan;
  final String? mainUse;
  final String? url;

  const ItemProduct({
    Key? key,
    this.title,
    this.slogan,
    this.mainUse,
    this.url,
  }) : super(key: key);

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white70,
                  // Màu của shadow
                  spreadRadius: 2,
                  // Điều chỉnh độ lan rộng của shadow
                  blurRadius: 4,
                  // Điều chỉnh độ mờ của shadow
                  offset: Offset(0, 2), // Điều chỉnh vị trí của shadow
                )
              ]),
          child: ListTile(
            title: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffc89595),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "http://drive.google.com/uc?export=view&id=12RVQ5VCX-IIL3gbdVjidBOFp3nr9_ViY",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "JilGyungYi Pro",
                      style: TextStyle(fontSize: 20, color: Color(0xffc89595)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Chăm sóc “cô bé” chỉ với 2 viên mỗi tuần!",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffc89595),
                            )
                          ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Duy trì độ PH cân bằng, dưỡng ẩm, giảm tình trạng khô hạn \n . Se khít vùng kín cho phụ nữ mãn kinh, phụ nữ sau sinh \n . Giảm viêm nhiễm, khí hư, nấm ngứa, làm sáng vùng da sậm màu.",
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailProduct())),
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffc89595),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Xem Chi Tiết",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
  }
}
