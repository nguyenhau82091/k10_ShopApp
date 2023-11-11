import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:k10_shopapp/auth/login.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  final List<Introduction> list = [
    Introduction(
      title: 'Title 1',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/image/onboarding1.png',
      imageHeight: 350,
      imageWidth: 350,
    ),
    Introduction(
      title: 'Title 2',
      subTitle: 'Your order will be immediately collected and sent',
      imageUrl: 'assets/image/onboarding2.png',
      imageHeight: 350,
      imageWidth: 350,
    ),
    Introduction(
      title: 'Title 3',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/image/onboarding3.png',
      imageHeight: 350,
      imageWidth: 350,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: const Color(0xFFf9f9f9),
      foregroundColor: const Color(0xFFFFAA00),
      introductionList: list,
      onTapSkipButton: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage())),
      skipTextStyle: const TextStyle(
        color: Colors.blueGrey,
        fontSize: 18.0,
      ),
    );
  }
}
