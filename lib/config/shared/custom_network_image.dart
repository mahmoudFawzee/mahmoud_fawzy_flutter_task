import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/image_manger.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imgUrl,
    required this.assetPlaceholder,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
  });

  final String imgUrl;
  final String assetPlaceholder;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage(ImageManger.loadingImage),
      fit: fit,
      width: width,
      height: height,
      image: CachedNetworkImageProvider(imgUrl),
      imageErrorBuilder: (context, error, stackTrace) =>
          errorBuilderWidget(assetPlaceholder),
    );
  }

  Widget errorBuilderWidget(String imagePath) {
    if (imagePath.contains('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
      );
    }
    return Image.asset(imagePath, width: width, height: height, fit: fit);
  }
}
