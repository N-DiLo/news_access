import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart';
import 'package:news_access/core/shared/utils/news_text.dart';

class NewsLoader extends StatelessWidget {
  const NewsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 40,
        maxWidth: 40,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width(context, .35),
        vertical: height(context, .41),
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            radius: 25,
            animating: true,
            color: orangeColor,
          ),
          SizedBox(height: height(context, .01)),
          NewsText(
            text: 'Loading news...',
            style: bodySmall,
          ),
        ],
      ),
    );
  }

  static void showSpinner(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const NewsLoader(),
    );
  }

  static void hideSpinner(BuildContext context) {
    Navigator.pop(context);
  }
}
