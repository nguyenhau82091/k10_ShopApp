import 'package:flutter/material.dart';

class ItemProduct extends StatefulWidget {
  final String? title;
  final String? slogan;
  final String? mainUse;
  final List<String>? urls;
  final VoidCallback? onTap;

  const ItemProduct({
    Key? key,
    this.title,
    this.slogan,
    this.mainUse,
    this.urls,
    this.onTap,
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
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
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
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.urls![0],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: TextStyle(fontSize: 20, color: Color(0xffc89595)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.slogan!,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 30),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(widget.mainUse!),
              SizedBox(height: 30),
              GestureDetector(
                onTap: widget.onTap,
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
