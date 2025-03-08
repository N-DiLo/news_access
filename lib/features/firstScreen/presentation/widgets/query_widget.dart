import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/core/constants/news_access_textstyles.dart';
import 'package:news_access/core/constants/news_colors_images.dart';
import 'package:news_access/core/shared/utils/news_access_sizes.dart';
import 'package:news_access/core/shared/utils/news_store.dart';
import 'package:news_access/core/shared/utils/news_text.dart';
import 'package:news_access/core/shared/widgets/news_btn.dart';

class QueryWidget extends ConsumerWidget {
  const QueryWidget({
    super.key,
    required this.item,
    required this.index,
    this.onTap,
  });

  final String item;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: onTap,
      leading: NewsText(
        text: '$index.',
        style: bodyMedium,
      ),
      title: NewsText(
        text: item,
        style: bodyMedium,
      ),
      trailing: GestureDetector(
        onTap: () => delItem(
          item: item,
          ref: ref,
          context: context,
        ),
        child: Icon(
          Icons.delete_sweep_outlined,
          color: orangeColor,
        ),
      ),
    );
  }

  static void delItem({
    required WidgetRef ref,
    required BuildContext context,
    VoidCallback? onTap,
    required String item,
  }) async {
    await showDialog(
      context: context,
      builder: (_) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: width(context, .16),
            vertical: height(context, .39),
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewsText(
                textAlign: TextAlign.center,
                text: 'Are you sure you want to delete?',
                style: bodyMedium.copyWith(
                  fontSize: 17,
                ),
              ),
              SizedBox(height: height(context, .03)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width(context, .25),
                    height: height(context, .05),
                    child: NewsButton(
                      title: 'Yes',
                      onTap: onTap ??
                          () async {
                            Navigator.pop(context);
                            await ref
                                .read(newsStoreProvider.notifier)
                                .removeSearch(item);
                          },
                      style: bodyMedium.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width(context, .25),
                    height: height(context, .05),
                    child: NewsButton.outline(
                      onTap: () => Navigator.pop(context),
                      title: 'Cancel',
                      style: bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
