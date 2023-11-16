import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:k10_shopapp/auth/login.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  final List<Introduction> list = [
    Introduction(
      title: 'Khởi Nguồn',
      subTitle: 'Câu chuyện bắt nguồn từ tình yêu và sự tinh tế của người chồng.',
      imageUrl: 'assets/image/onboarding1.png',
      imageHeight: 350,
      imageWidth: 350,
    ),
    Introduction(
      title: 'Cam Kết',
      subTitle: 'Sử dụng tối đa những nguyên liệu từ thiên nhiên.',
      imageUrl: 'assets/image/onboarding2.png',
      imageHeight: 350,
      imageWidth: 350,
    ),
    Introduction(
      title: 'Nhận Diện Thương Hiệu',
      subTitle:
          'JilGyungYi tin rằng vẻ đẹp đích thực đến từ hạnh phúc khi phụ nữ cảm thấy thoải mái và tự tin',
      imageUrl: 'assets/image/onboarding3.png',
      imageHeight: 350,
      imageWidth: 350,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: const Color(0xFFf9f9f9),
      foregroundColor: const Color.fromARGB(255, 205, 75, 0),
      introductionList: list,
      onTapSkipButton: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage())),
      skipTextStyle: const TextStyle(
        color: Colors.blueGrey,
        fontSize: 18.0,
      ),
    );
  }
}
