import 'package:flutter/material.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors_images.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart';
import 'package:news_access/core/shared/utils/news_text.dart';

class DetailsModal extends StatelessWidget {
  const DetailsModal({
    super.key,
    this.imageURL,
    this.title,
    this.content,
    this.author,
    this.desc,
    this.source,
  });

  final String? imageURL;
  final String? title;
  final String? content;
  final String? author;
  final String? desc;
  final String? source;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        maxHeight: height(context, .75),
      ),
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: height(context, .27),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageURL ?? '',
                ),
              ),
            ),
          ),
          SizedBox(height: height(context, .01)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                NewsText(
                  text: title != null
                      ? '${title!.toUpperCase()} - By: $author'
                      : '',
                  style: bodyMedium,
                  overflow: TextOverflow.clip,
                ),
                Divider(
                  color: greyColor[500],
                  thickness: 0.5,
                ),
                SizedBox(height: height(context, .006)),
                NewsText(
                  text: 'Content: ',
                  style: bodyMedium,
                ),
                NewsText(
                  text: content ?? '',
                  style: bodyText,
                ),
                SizedBox(height: height(context, .008)),
                NewsText(
                  text: 'Description: ',
                  style: bodyMedium,
                ),
                NewsText(
                  text: desc ?? '',
                  style: bodyText,
                ),
                SizedBox(height: height(context, .01)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: NewsText(
                    text: 'Source: ${source ?? ''}',
                    style: bodyMedium,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void showModal({
    required BuildContext context,
    String? image,
    String? title,
    String? content,
    String? desc,
    String? author,
    String? source,
  }) {
    showModalBottomSheet(
        useSafeArea: true,
        enableDrag: true,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return DetailsModal(
            imageURL: image,
            title: title,
            content: content,
            author: author,
            desc: desc,
            source: source,
          );
        });
  }
}
