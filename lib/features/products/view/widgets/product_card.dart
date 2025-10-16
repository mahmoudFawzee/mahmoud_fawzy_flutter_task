import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

import '../../../../config/resources/image_manger.dart';
import '../../../../config/shared/custom_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: context.greyBorder),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomNetworkImage(
            imgUrl:
                'https://m.media-amazon.com/images/I/41S+9swCRBL._AC_SX569_.jpg',
            assetPlaceholder: ImageManger.loadingImage,
          ),
          Row(
            children: [
              const Flexible(
                child: Text(
                  'جاكيت من الصوف و الجلد المتين الجميل',
                  style: TextStyle(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SvgPicture.asset(ImageManger.offerImage),
            ],
          ),

          Row(
            children: [
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.noScaling,
                  maxLines: 1,
                  text: TextSpan(
                    style: context.textStyles.bodyMedium!,
                    children: [
                      TextSpan(
                        text: '5000,000جم /',
                        style: TextStyle(color: context.deepOrange),
                      ),
                      TextSpan(
                        text: '5000,600جم',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationColor: context.fontGrey,
                          decorationStyle: TextDecorationStyle.solid,
                          color: context.fontGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 1,
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(ImageManger.fire),
              const SizedBox(width: 4),
              Text(
                'تم بيع +3.3k',
                style: context.textStyles.bodySmall!.copyWith(
                  fontSize: 10,
                  color: context.fontGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(ImageManger.checkIcon),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: context.lightBlue,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(ImageManger.factoryIcon),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 24,
                      width: 32,
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: context.white,
                        border: Border.all(color: context.greyBorder),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: SvgPicture.asset(ImageManger.addShoppingCart),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      ImageManger.talatMostafaImage,
                      height: 24,
                      width: 32,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
