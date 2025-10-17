import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

import '../../../../l10n/app_localizations.dart';

class ContactUsCard extends StatelessWidget {
  const ContactUsCard({super.key, required this.appLocalizations});

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: context.greyBorder),
        color: context.offWhit,
      ),
      child: Column(
        children: [
          Text(appLocalizations.specialPackages),
          Text(appLocalizations.contactUs),
          TextButton(
            onPressed: () {},
            child: Text(appLocalizations.sellingTeam),
          ),
        ],
      ),
    );
  }
}
