import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart';
import 'package:news_access/core/shared/utils/news_text.dart';
import 'package:news_access/core/shared/widgets/news_btn.dart';
import 'package:news_access/core/shared/widgets/news_input.dart';
import 'package:news_access/features/firstScreen/viewmodels/first_screen_model.dart';

class QueryScreen extends ConsumerStatefulWidget {
  const QueryScreen({super.key});
  static const routeName = '/query';

  @override
  ConsumerState<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends ConsumerState<QueryScreen> {
  final _newsSearchController = TextEditingController();
  final _firstScreenModel = FirstScreenModel();

  @override
  void dispose() {
    _newsSearchController.dispose();
    super.dispose();
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
              onTap: () => _firstScreenModel.searchNews(
                ref: ref,
                context: context,
                controller: _newsSearchController,
              ),
              style: bodyMedium.copyWith(color: whiteColor),
            )
          ],
        ),
      ),
    );
  }
}
