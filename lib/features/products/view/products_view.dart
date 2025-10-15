import 'dart:developer';
import 'package:flutter/material.dart';
import '/config/theme/app_theme.dart';
import '/l10n/app_localizations.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const pageRoute = '/products-screen';

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 45),
          PageLeading(appLocalizations: appLocalizations),
          const SizedBox(height: 10),
          const CategoriesSection(),
        ],
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.extraLightOrange,
              border: Border.all(color: context.greyBorder),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Text(
              'كل العروض',
              style: context.textStyles.bodyMedium!.copyWith(
                color: index == 0 ? context.lightOrang : context.fontGrey,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PageLeading extends StatelessWidget {
  const PageLeading({super.key, required this.appLocalizations});

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appLocalizations.discoverOffers,
            style: context.textStyles.headlineLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () => log('filtering page'),
            child: Row(
              children: [
                Text(
                  appLocalizations.all,
                  style: context.textStyles.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.fontGrey,
                  ),
                ),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
