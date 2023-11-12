import 'package:flutter/material.dart';
import 'package:k10_shopapp/service/auth_service.dart';
import 'package:k10_shopapp/utils/color_utils.dart';
import 'package:k10_shopapp/widget/my_button.dart';
import 'package:k10_shopapp/widget/reusable_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Quên Mật Khẩu",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
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
            child: Column(children: <Widget>[
              logoWidget("assets/logo/logo.png"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "   Bạn Quên Mật Khẩu? Đừng Lo, Đây Là Cách Khôi Phục Tài Khoản Của Bạn!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              reusableTextField("Nhập Email", Icons.email_outlined, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                  text: 'Send',
                  onTap: () {
                    AuthService.ForgotPassword(_emailTextController.text);
                    Navigator.pop(context);
                  })
            ]),
          ))),
    );
  }
}
