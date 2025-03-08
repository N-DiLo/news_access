import 'package:flutter/material.dart';
import 'package:news_access/features/firstScreen/presentation/query_screen.dart';
import 'package:news_access/features/secondScreen/presentation/detail_screen.dart';
import 'package:news_access/features/splash/presentation/splash_screen.dart';

class NewsAccessNav {
  static const String splash = SplashScreen.routeName;
  static const String detail = DetailScreen.routeName;
  static const String query = QueryScreen.routeName;

  static Map<String, WidgetBuilder> get routes {
    return {
      splash: (context) => const SplashScreen(),
      detail: (context) => const DetailScreen(),
      query: (context) => const QueryScreen(),
    };
  }
}
