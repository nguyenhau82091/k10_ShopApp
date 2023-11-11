import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color.fromARGB(235, 240, 101, 205),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Color.fromARGB(235, 240, 101, 205),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 238, 220, 63),
            gap: 8,
            onTabChange: (index) {
              print(index);
              setState(() {});
            },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Trang chủ",
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: "Giỏ hàng",
              ),
              GButton(
                icon: Icons.phone_android,
                text: "Liên hệ",
              ),
              GButton(icon: Icons.settings, text: "Cài đặt"),
            ],
          ),
        ),
      ),
    );
  }
}
