import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors_images.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart';
import 'package:news_access/core/shared/utils/news_store.dart';
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
  final NewsStore _store = NewsStore();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _firstScreenModel.loadHistory();
    });
  }

  @override
  void dispose() {
    _newsSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final queries = _store.getSearchHistory();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: NewsText(
          text: 'QueryScreen',
          style: bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: height(context, .02)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height(context, .04)),
              NewsInput(
                borderColor: orangeColor,
                hintText: 'Search News',
                textCapitalization: TextCapitalization.sentences,
                controller: _newsSearchController,
              ),
              SizedBox(height: height(context, .02)),
              NewsButton(
                title: 'Search News',
                onTap: () => _firstScreenModel.searchNews(
                  ref: ref,
                  context: context,
                  controller: _newsSearchController,
                ),
                style: bodyMedium.copyWith(color: whiteColor),
              ),
              SizedBox(height: height(context, .03)),
              NewsText(
                text: 'Previous Queries',
                style: bodyMedium,
              ),
              SizedBox(height: height(context, .02)),
              if (queries.isEmpty)
                Column(
                  children: [
                    SizedBox(height: height(context, .2)),
                    Image.asset(
                      news,
                      scale: 8,
                    ),
                    Center(
                      child: NewsText(
                        text: 'No Search Results Yet',
                        style: bodyMedium,
                      ),
                    ),
                  ],
                )
              else
                Flexible(
                  child: SizedBox(
                    height: height(context, .4),
                    child: ListView.separated(
                      itemCount: queries.length,
                      itemBuilder: (context, index) {
                        final item = queries[index];

                        return ListTile(
                          title: NewsText(
                            text: item,
                            style: bodyMedium,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        thickness: 0.5,
                        color: greyColor[100]!,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
