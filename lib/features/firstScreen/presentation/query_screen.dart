import 'package:flutter/material.dart';
import 'package:news_access/core/constants/news_colors.dart';
import 'package:news_access/core/shared/utils/news_text.dart';

class QueryScreen extends StatelessWidget {
  const QueryScreen({super.key});
  static const routeName = '/query';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: NewsText(
          text: 'QueryScreen',
        ),
      ),
    );
  }
}
