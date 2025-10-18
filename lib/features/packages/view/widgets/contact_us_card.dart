import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

import '../../../../l10n/app_localizations.dart';

class ContactUsCard extends StatelessWidget {
  const ContactUsCard({super.key, required this.appLocalizations});

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: context.greyBorder),
        color: context.black.withValues(alpha: .05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appLocalizations.specialPackages,
            style: context.textStyles.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(appLocalizations.contactUs),
          GestureDetector(
            onTap: () {},
            child: Text(
              appLocalizations.sellingTeam,
              style: context.textStyles.bodyLarge!.copyWith(
                color: context.deepBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
