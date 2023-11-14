import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:k10_shopapp/screen/blog.dart';
import 'package:k10_shopapp/screen/cart.dart';
import 'package:k10_shopapp/screen/home_screen.dart';
import 'package:k10_shopapp/screen/setting.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CartPage(),
    BlogPage(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: const Color(0xFFc89595),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: GNav(
            backgroundColor: const Color(0xFFc89595),
            color: Colors.white,
            activeColor: Colors.white,
            // tabBackgroundColor: Color.fromARGB(255, 218, 198, 20),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: const EdgeInsets.all(16),
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const GButton(
                icon: Icons.home,
                text: "Trang chủ",
              ),
              const GButton(
                icon: Icons.shopping_cart,
                text: "Giỏ Hàng",
              ),
              const GButton(
                icon: Icons.article,
                text: "Blog",
              ),
              const GButton(icon: Icons.settings, text: "Cài đặt"),
            ],
          ),
        ),
      ),
    );
  }
}
