import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k10_shopapp/auth/forgotpassword.dart';
import 'package:k10_shopapp/auth/register.dart';
import 'package:k10_shopapp/home_menu.dart';
import 'package:k10_shopapp/utils/color_utils.dart';
import 'package:k10_shopapp/widget/my_button.dart';
import 'package:k10_shopapp/widget/reusable_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

void login() {
  print("login");
  
}

Future<void> loginWithGoogle() async {
  print("login with google");
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/logo/logo.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                    "Email", Icons.email_outlined, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Mật Khẩu", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                const SizedBox(
                  height: 20,
                ),
                const MyButton(
                  text: 'Đăng nhập',
                  onTap: login,
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Đăng nhập với Google',
                  onTap: onTap,
                  image: Image.asset(
                    'assets/logo/icons_googl.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(height: 20),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Chưa có tài khoản?",
            style: TextStyle(color: Colors.white70, fontSize: 16)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Đăng ký",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Quên mật khẩu?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
