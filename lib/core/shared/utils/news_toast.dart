import 'package:flutter/material.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors_images.dart';
import 'package:news_access/core/shared/utils/news_text.dart';
import 'package:toastification/toastification.dart';

class NewsToast {
  static void show({
    BuildContext? context,
    required String message,
    TextStyle? style,
    bool? showIcon,
    ToastificationStyle? toastStyle,
    ToastificationType type = ToastificationType.error,
    Duration autoCloseDuration = const Duration(seconds: 2),
  }) {
    switch (type) {
      case ToastificationType.success:
        break;
      case ToastificationType.info:
        break;
      case ToastificationType.warning:
        break;
    }
    toastification.show(
      showIcon: showIcon,
      context: context,
      style: toastStyle,
      type: type,
      autoCloseDuration: autoCloseDuration,
      title: NewsText(
        text: message,
        style: style ??
            bodySmall.copyWith(
              color: whiteColor,
            ),
        overflow: TextOverflow.clip,
      ),
    );
  }
}
