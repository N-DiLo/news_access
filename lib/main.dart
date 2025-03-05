import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/features/navigation/presentation/news_access_nav.dart';
import 'package:news_access/features/splash/presentation/splash_screen.dart';
import 'package:toastification/toastification.dart';

import 'core/constants/news_colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lexend',
          colorScheme: ColorScheme.fromSeed(
            seedColor: orangeColor,
          ),
          useMaterial3: true,
        ),
        routes: NewsAccessNav.routes,
        home: const SplashScreen(),
      ),
    );
  }
}
