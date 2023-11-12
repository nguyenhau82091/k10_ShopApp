import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("Thông tin tài khoản"),
            leading: Icon(Icons.person),
            onTap: () {
              // Navigate to account info page
            },
          ),
          ListTile(
            title: Text("Cài đặt thông báo"),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Navigate to notification settings page
            },
          ),
          ListTile(
            title: Text("Ngôn ngữ"),
            leading: Icon(Icons.language),
            onTap: () {
              // Navigate to language settings page
            },
          ),
          ListTile(
            title: Text("Đăng xuất"),
            leading: Icon(Icons.logout),
            onTap: () {
              // Log out user
            },
          ),
        ],
      ),
    );
  }
}
  
