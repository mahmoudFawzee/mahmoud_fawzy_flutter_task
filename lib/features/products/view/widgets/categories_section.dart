import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

import '../../../../l10n/app_localizations.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return SizedBox(
      height: 41,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: index == 0 ? 16 : 8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.deepOffWhite,
              border: Border.all(color: context.greyBorder),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Text(
              appLocalizations.allOffers,
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
