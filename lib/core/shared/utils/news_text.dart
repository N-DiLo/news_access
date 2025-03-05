import 'package:flutter/material.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';

class NewsText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final bool? softWrap;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double? lineHeight;
  final double? letterSpacing;
  final int? maxLines;

  const NewsText({
    super.key,
    required this.text,
    this.style,
    this.overflow,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.lineHeight,
    this.maxLines,
    this.textAlign,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      textScaler: MediaQuery.of(context).textScaler,
      style: style ?? bodyText,
    );
  }
}
