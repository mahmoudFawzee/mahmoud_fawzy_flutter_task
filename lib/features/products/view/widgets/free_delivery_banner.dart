import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/config/theme/app_theme.dart';

import '../../../../l10n/app_localizations.dart';

class FreeDeliveryBanner extends StatelessWidget {
  const FreeDeliveryBanner({super.key, required this.appLocalizations});

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      margin: const EdgeInsets.symmetric(horizontal: 16),

      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.deepOffWhite,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.check, color: context.green),
              const SizedBox(width: 8),
              Text(
                appLocalizations.freeDelivery,
                style: context.textStyles.bodyMedium!.copyWith(
                  color: context.green,
                ),
              ),
            ],
          ),
          Text(
            appLocalizations.ifOrderNow,
            style: context.textStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
