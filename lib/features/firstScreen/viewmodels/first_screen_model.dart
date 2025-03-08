import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors_images.dart';
import 'package:news_access/core/shared/utils/news_store.dart';
import 'package:news_access/core/shared/utils/news_toast.dart';
import 'package:news_access/core/shared/widgets/news_loader.dart';
import 'package:news_access/features/navigation/models/news_arguments.dart';
import 'package:news_access/features/navigation/presentation/news_access_nav.dart';
import 'package:news_access/features/secondScreen/domain/news_provider.dart';
import 'package:toastification/toastification.dart';

class FirstScreenModel {
  void gotoArticleScreen({required BuildContext context, Object? arguments}) {
    Navigator.pushNamed(context, NewsAccessNav.detail, arguments: arguments);
  }

  Future<void> searchNews({
    required BuildContext context,
    required WidgetRef ref,
    required TextEditingController controller,
  }) async {
    final searchQuery = controller.text.trim();
    if (searchQuery.isEmpty) {
      NewsToast.show(
        type: ToastificationType.error,
        toastStyle: ToastificationStyle.fillColored,
        message: 'Enter a valid query',
        style: bodyText.copyWith(
          color: whiteColor,
        ),
      );

      return;
    } else {
      NewsLoader.showSpinner(context);
      await ref.read(newsStoreProvider.notifier).saveSearch(searchQuery);
      await ref.watch(newsNotifierProvider.notifier).getNews(
            query: searchQuery,
          );
      controller.clear();
      if (context.mounted) {
        NewsLoader.hideSpinner(context);
        gotoArticleScreen(
          context: context,
          arguments: NewsArguments(
            newsData: searchQuery,
          ),
        );
      }
    }
  }

  Future<void> loadHistory(WidgetRef ref) async {
    await ref.watch(newsStoreProvider.notifier).loadSearch();
  }
}
