import 'package:flutter/material.dart';
import 'package:k10_shopapp/auth/login.dart';
import 'package:k10_shopapp/home_menu.dart';
import 'package:k10_shopapp/screen/community.dart';
import 'package:k10_shopapp/screen/contact.dart';
import 'package:k10_shopapp/screen/edit_profile.dart';
import 'package:k10_shopapp/screen/home_screen.dart';
import 'package:k10_shopapp/screen/list_order.dart';
import 'package:k10_shopapp/screen/new.dart';
import 'package:k10_shopapp/screen/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomeMenu(),
        '/contact': (context) => ContactInformation(),
        '/new': (context) => CodePostScreen(),
        '/edit': (context) => EditAccountScreen(),
        '/list_order': (context) => ListOrder(),
        '/community': (context) => CommunityPage(),
      },
    );
  }
}
