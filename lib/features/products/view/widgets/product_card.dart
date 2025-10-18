import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/cubits/bool_based_cubit.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/model/product.dart';

import '../../../../config/resources/image_manger.dart';
import '../../../../config/shared/custom_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
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
          CustomNetworkImage(
            imgUrl: product.imageUrl,
            assetPlaceholder: ImageManger.loadingImage,
            height: 215.h,
            width: 158.w,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(product.name, overflow: TextOverflow.ellipsis),
              ),
              SvgPicture.asset(ImageManger.offerImage),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        text: '${product.price}جم',
                        style: TextStyle(color: context.deepOrange),
                      ),
                      if (product.hasOffer)
                        TextSpan(
                          text: '/${product.discountedPrice}جم',
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
              FavoriteIconButton(
                onChanged: (isFav) {
                  log('added to fav');
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 20),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SvgPicture.asset(ImageManger.checkIcon),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: context.lightBlue,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(ImageManger.factoryIcon),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
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

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    super.key,
    this.isFavorite = false,
    required this.onChanged,
  });
  final bool isFavorite;
  final Function(bool isFav)? onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoolBasedCubit(isSelected: isFavorite),
      child: Builder(
        builder: (context) {
          return BlocBuilder<BoolBasedCubit, bool>(
            builder: (context, state) {
              return GestureDetector(
                behavior: HitTestBehavior
                    .opaque, // makes the tap area cover the icon only
                onTap: () {
                  onChanged?.call(!state);
                  context.read<BoolBasedCubit>().change();
                },
                child: Icon(
                  state ? Icons.favorite : Icons.favorite_border_outlined,
                  //?on error is red
                  color: state ? context.errorColor : null,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
