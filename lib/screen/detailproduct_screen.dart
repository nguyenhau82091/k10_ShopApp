import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List<String> imageUrls = [
    "http://drive.google.com/uc?export=view&id=12wzSgzhfQa-Zr7vnmlxr8f6xoju2V69Q",
    "http://drive.google.com/uc?export=view&id=1g5YuwVbLrCApWX6HragPsgytO_sMqzj-",
    "http://drive.google.com/uc?export=view&id=1SvOxB9xc0EWcsj78btoZbAskWn4mmz_5",
    "http://drive.google.com/uc?export=view&id=1sjSMlsT_2vd-3ihsPTGqsUBFVi6ocZ0i",
    "http://drive.google.com/uc?export=view&id=10L1-2Rzvu2k-6CNePtomM90-XjYlqiQR"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Image.asset(
                "assets/logo.png",
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
                          "http://drive.google.com/uc?export=view&id=12RVQ5VCX-IIL3gbdVjidBOFp3nr9_ViY",
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
                        itemCount: imageUrls.length,
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
                                  imageUrls[index],
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
                          "JilGyungYi Pro",
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
                          "279.000 Đ",
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
                            onTap: () => {},
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
