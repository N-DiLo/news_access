import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/core/constants/news_colors.dart';
import 'package:news_access/core/shared/utils/news_text.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key});
  static const routeName = '/detail';

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: const Center(
        child: NewsText(text: 'Detail Screen'),
      ),
    );
  }
}
