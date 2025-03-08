import 'package:flutter/material.dart';
import 'package:news_access/features/navigation/presentation/news_access_nav.dart';

class SplashViewModel {
  void gotoNxtScreen({
    required BuildContext context,
    Object? arguments,
  }) {
    Navigator.popAndPushNamed(
      context,
      NewsAccessNav.query,
      arguments: arguments,
    );
  }

  Future<void> gotoNxtScreenWithDelay({
    required BuildContext context,
    Object? arguments,
  }) async {
    await Future.delayed(const Duration(seconds: 4)).then((_) {
      if (context.mounted) {
        gotoNxtScreen(
          context: context,
          arguments: arguments,
        );
      }
    });
  }
}
