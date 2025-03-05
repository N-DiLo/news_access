import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_access/core/constants/news_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              splashImg,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
