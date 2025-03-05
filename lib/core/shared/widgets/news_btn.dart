import 'package:flutter/material.dart';
import 'package:news_access/core/constants/news_colors.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart' as hgt;

class NewsButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? borderColor;
  final double? height;
  final bool outline;
  final bool any;
  final TextStyle? style;
  final void Function()? onTap;

  const NewsButton({
    super.key,
    this.style,
    this.height,
    this.onTap,
    this.color,
    this.borderColor,
    required this.title,
    this.outline = false,
    this.any = false,
  });

  const NewsButton.outline({
    super.key,
    required this.title,
    this.style,
    this.height,
    this.onTap,
    this.color,
    this.borderColor,
  })  : outline = true,
        any = false;

  const NewsButton.any({
    super.key,
    this.height,
    required this.title,
    this.style,
    this.onTap,
    this.color,
    this.borderColor,
  })  : any = true,
        outline = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: double.infinity,
        height: height ?? hgt.height(context, .06),
        alignment: Alignment.center,
        decoration: any
            ? BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  style: BorderStyle.solid,
                  color: borderColor ?? orangeColor,
                ),
              )
            : outline
                ? BoxDecoration(
                    color: greyColor[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: transparent, width: 1),
                  )
                : BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
        child: Center(
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
