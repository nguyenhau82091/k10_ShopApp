import 'package:flutter/material.dart';
import 'package:k10_shopapp/auth/forgotpassword.dart';
import 'package:k10_shopapp/auth/register.dart';
import 'package:k10_shopapp/home_menu.dart';
import 'package:k10_shopapp/utils/color_utils.dart';
import 'package:k10_shopapp/widget/my_button.dart';
import 'package:k10_shopapp/widget/reusable_widget.dart';
import 'package:k10_shopapp/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> getData() async {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Vui lòng  nhập đầy đủ thông tin.');
      return;
    }

    try {
      final login = await AuthService.login(email, password);

      if (login) {
        setState(() {
          _isLoading = true;
        });
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _showErrorDialog('Tên đăng nhập hoặc mật khẩu không chính xác.');
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
          title: Text('Lỗi'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("c89595"),
              hexStringToColor("c27e7e"),
              hexStringToColor("c26161"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height *
                  0.15, // Adjust this value to move content higher
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/logo/logo.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                  "Email",
                  Icons.email_outlined,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Mật Khẩu",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: 'Đăng nhập',
                  onTap: getData,
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Đăng nhập với Google',
                  onTap: AuthService.loginGG,
                  image: Image.asset(
                    'assets/logo/icons_googl.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(height: 20),
                signUpOption(),
                const SizedBox(height: 20),
                if (_errorMessage.isNotEmpty)
                  Stack(
                    children: [
                      // Your original content
                      Column(
                        children: [
                          SizedBox(height: 20),
                          // Add any additional content here
                        ],
                      ),
                      // Notification badge
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFc26161),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          _errorMessage,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
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
        const Text(
          "Chưa có tài khoản?",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: const Text(
            " Đăng ký",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
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
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResetPassword()),
          );
        },
      ),
    );
  }
}
