import 'package:flutter/material.dart';
import 'package:k10_shopapp/auth/login.dart';
import 'package:k10_shopapp/utils/color_utils.dart';
import 'package:k10_shopapp/widget/my_button.dart';
import 'package:k10_shopapp/widget/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

void onTap() {
  print("Đăng Ký");
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("c89595"),
            hexStringToColor("c27e7e"),
            hexStringToColor("c26161")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                const MyButton(text: "Đăng Ký", onTap: onTap),
                const SizedBox(
                  height: 20,
                ),
                signInOption()
              ],
            ),
          ))),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Đã có tài khoản?",
            style: TextStyle(color: Colors.white70, fontSize: 16)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: const Text(
            " Đăng nhập",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }
}
