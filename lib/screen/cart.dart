import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ hàng"),
        backgroundColor: Color(0xFFc89595),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              "https://via.placeholder.com/150",
              width: 50,
              height: 50,
            ),
            title: Text("Product ${index + 1}"),
            subtitle: Text("Price: \$${(index + 1) * 10}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Total: \$30",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Checkout"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
