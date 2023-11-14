import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting {
  final String title;
  final String route;
  final IconData icon;

  Setting({
    required this.title,
    required this.icon,
    required this.route,
  });
}

final List<Setting> settings = [
  Setting(
    title: "Thông tin cá nhân",
    route: "/edit",
    icon: CupertinoIcons.person_fill,
  ),
  Setting(
    title: "Đơn Hàng",
    route: "/list_order",
    icon: CupertinoIcons.shopping_cart,
  ),
  Setting(
    title: "Mã giới thiệu",
    route: "/order",
    icon: CupertinoIcons.heart_fill,
  ),
];

final List<Setting> settings2 = [
  Setting(
    title: "Câu hỏi thường gặp",
    route: "/order",
    icon: CupertinoIcons.ellipsis_vertical_circle_fill,
  ),
  Setting(
    title: "Giới Thiệu",
    route: "/community",
    icon: CupertinoIcons.person_3_fill,
  ),
  Setting(
    title: "Đăng xuất",
    route: "/order",
    icon: CupertinoIcons.square_arrow_right,
  ),
];
