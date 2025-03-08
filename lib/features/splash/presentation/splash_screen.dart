import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors_images.dart';
import 'package:news_access/core/shared/utils/news_text.dart';
import 'package:news_access/features/splash/viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashViewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _splashViewModel.gotoNxtScreenWithDelay(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              splashImg,
              width: 200,
              height: 100,
            ),
            NewsText(
              text: 'A better way to stay updated.',
              style: bodyText,
            )
          ],
        ),
      ),
    );
  }
}
