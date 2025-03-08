import 'package:flutter/material.dart';
import 'package:news_access/core/constants/news_colors_images.dart';

class NewsImageWidget extends StatelessWidget {
  const NewsImageWidget({
    super.key,
    required this.imageURL,
    this.fit,
    this.filterQuality,
    this.width,
    this.height,
  });

  final String imageURL;
  final BoxFit? fit;
  final FilterQuality? filterQuality;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyColor[100]!,
          width: 1.5,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: fit ?? BoxFit.cover,
          filterQuality: filterQuality ?? FilterQuality.medium,
          image:
              imageURL.isNotEmpty ? NetworkImage(imageURL) : AssetImage(sImg),
        ),
      ),
    );
  }
}
