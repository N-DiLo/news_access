import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart';
import 'package:news_access/core/shared/utils/news_text.dart';
import 'package:news_access/features/navigation/models/news_arguments.dart';
import 'package:news_access/features/secondScreen/presentation/widgets/image_widget.dart';
import 'package:news_access/features/secondScreen/providers/news_provider.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key});
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ModalRoute.of(context)!.settings.arguments;
    final fetchedData = route is NewsArguments ? route : NewsArguments();

    final provider = ref.watch(
      newsNotifierProvider.select(
        (v) => v.newsModel,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: NewsText(
          text: 'Articles for: ${fetchedData.newsData}',
          style: bodyMedium,
        ),
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context, .04)),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: greyColor[500],
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            final items = provider?.articles;
            final articles = items![index];
            return ListTile(
              leading: NewsImageWidget(
                imageURL: articles.urlToImage ?? '',
              ),
              title: NewsText(
                text: '${articles.title}',
                style: bodyMedium,
              ),
              subtitle: NewsText(
                text: '${articles.description}',
                style: bodySmall,
              ),
            );
          },
        ),
      ),
    );
  }
}
