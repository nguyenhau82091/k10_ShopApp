import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:k10_shopapp/api/api.dart';
import 'package:k10_shopapp/auth/login.dart';
import 'package:k10_shopapp/utils/color_utils.dart';
import 'package:k10_shopapp/widget/my_button.dart';
import 'package:k10_shopapp/widget/reusable_widget.dart';
import 'package:http/http.dart' as http;
import 'package:k10_shopapp/service/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> getData() async {
    final name = _userNameTextController.text;
    final email = _emailTextController.text;
    final password = _passwordTextController.text;

    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      _showErrorDialog('Vui lòng nhập đầy đủ thông tin.');
      return;
    }

    try {
      final register = await AuthService.registerUser(name, email, password);

      if (register) {
        setState(() {
          _isLoading = true;
        });
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      print(e);
      _showErrorDialog('Đã xảy ra lỗi. Vui lòng thử lại sau.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Lỗi'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("c89595"),
              hexStringToColor("c27e7e"),
              hexStringToColor("c26161")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/logo/logo.png"),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Tên người dùng", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Email", Icons.email_outlined, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Mật Khẩu", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                MyButton(text: "Đăng Ký", onTap: getData),
                const SizedBox(
                  height: 20,
                ),
                signInOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Bạn đã có tài khoản?",
            style: TextStyle(color: Colors.white70, fontSize: 16)),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: const Text(
            " Đăng nhập",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
