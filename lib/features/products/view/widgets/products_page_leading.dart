import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/config/theme/app_theme.dart';
import '/features/filters/view/filtering_screen.dart';

import '../../../../l10n/app_localizations.dart';

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
            onTap: () => context.push(FilteringScreen.pageRoute),
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
