import 'package:flutter/material.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart';

class NewsInput extends StatelessWidget {
  final Widget? trailing;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? style;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? leading;
  final TextStyle? hintStyle;
  final void Function()? trailingTapped;
  final void Function()? onTap;
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );
  final Color? borderColor;
  final double? borderWidth;
  final bool readOnly;
  final BoxConstraints? constraints;
  final TextInputAction? textInputAction;

  final TextCapitalization textCapitalization;

  NewsInput({
    super.key,
    this.onChanged,
    this.validator,
    this.controller,
    this.keyboardType,
    this.trailing,
    this.hintText,
    this.leading,
    this.hintStyle,
    this.style,
    this.trailingTapped,
    this.onTap,
    this.readOnly = false,
    this.borderColor,
    this.borderWidth,
    this.constraints,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style ??
              bodyMedium.copyWith(
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
          decoration: InputDecoration(
            constraints: constraints,
            contentPadding: const EdgeInsets.all(14),
            prefixIcon: leading,
            prefixIconConstraints: readOnly
                ? BoxConstraints(minWidth: width(context, .12))
                : constraints,
            suffixIconConstraints: readOnly
                ? BoxConstraints(minWidth: width(context, .1))
                : constraints,
            suffixIcon: trailing != null
                ? GestureDetector(
                    onTap: trailingTapped,
                    child: trailing,
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: orangeColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: orangeColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: orangeColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText ?? 'Enter hint text',
            hintStyle: hintStyle ??
                bodySmall.copyWith(
                    fontWeight: FontWeight.w300,
                    color: const Color(0xffACACAC)),
          ),
        ),
      ],
    );
  }
}
