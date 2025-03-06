import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart';
import 'package:news_access/core/shared/utils/news_text.dart';
import 'package:news_access/core/shared/utils/news_toast.dart';
import 'package:news_access/core/shared/widgets/news_btn.dart';
import 'package:news_access/core/shared/widgets/news_input.dart';
import 'package:news_access/core/shared/widgets/news_loader.dart';
import 'package:news_access/features/secondScreen/providers/news_provider.dart';
import 'package:toastification/toastification.dart';

class QueryScreen extends ConsumerStatefulWidget {
  const QueryScreen({super.key});
  static const routeName = '/query';

  @override
  ConsumerState<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends ConsumerState<QueryScreen> {
  final _newsSearchController = TextEditingController();

  @override
  void dispose() {
    _newsSearchController.dispose();
    super.dispose();
  }

  Future<void> _searchNews() async {
    final searchQuery = _newsSearchController.text.trim();
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
      await ref.watch(newsNotifierProvider.notifier).getNews(
            query: searchQuery,
          );
      _newsSearchController.clear();
      if (mounted) NewsLoader.hideSpinner(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: NewsText(
          text: 'QueryScreen',
          style: bodyMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height(context, .02)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height(context, .04)),
            NewsInput(
              borderColor: orangeColor,
              hintText: 'Search News',
              textCapitalization: TextCapitalization.sentences,
              controller: _newsSearchController,
            ),
            SizedBox(height: height(context, .04)),
            NewsButton(
              title: 'Search News',
              onTap: () => _searchNews(),
              style: bodyMedium.copyWith(color: whiteColor),
            )
          ],
        ),
      ),
    );
  }
}
