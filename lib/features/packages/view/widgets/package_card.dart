import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoudfawzy_flutter_task/l10n/app_localizations.dart';
import '/config/resources/image_manger.dart';
import '/config/theme/app_theme.dart';
import '/features/packages/model/features_icons.dart';
import '/features/packages/model/package.dart';
import '/features/packages/view/widgets/package_feature_card.dart';

import '../../../../config/shared/check_box/custom_check_box.dart';
import '../triangle_clip_path.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({super.key, required this.package});
  final Package package;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),

      child: Stack(
        children: [
          //?content
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.greyBorder),
                boxShadow: [
                  BoxShadow(
                    color: context.greyBorder,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCheckBox(
                        applyPadding: false,
                        label: package.name,
                        initialValue: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        '${package.price}ج.م',
                        style: context.textStyles.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.deepOrange,
                          decoration: TextDecoration.underline,
                          decorationThickness: 25,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FeatureCard(
                            iconPath: ImageManger.acuteIcon,
                            content:
                                'صلاحية الاعلان ${package.daysForExpiration} يوم',
                          ),
                          ...List.generate(package.features.length, (index) {
                            final feature = package.features[index];
                            return FeatureCard(
                              iconPath: feature.icon.imagePath,
                              content: feature.content,
                              hint: feature.hint,
                            );
                          }),
                        ],
                      ),
                      //if features is not empty
                      if (package.features.isNotEmpty)
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                constraints: BoxConstraints.loose(
                                  Size(71.w, 50.h),
                                ),
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  color: context.green.withValues(alpha: .05),
                                  border: Border(
                                    top: BorderSide(color: context.green),
                                    left: BorderSide(color: context.green),
                                    right: BorderSide(color: context.green),
                                  ),
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(35),
                                  ),
                                ),
                                child: Text(
                                  '${package.repeatingRatio}',
                                  style: TextStyle(color: context.green),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints.loose(
                                  Size(71.w, 50.h),
                                ),
                                color: context.white,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  appLocalizations.numberOfViews,
                                  style: context.textStyles.bodySmall!.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: context.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //?this is the banner
          if (package.bannerString != null)
            Positioned(
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  height: 31,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: context.extraLightOrange,

                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),

                    alignment: Alignment.centerRight,
                    child: Text(
                      package.bannerString!,

                      style: context.textStyles.displaySmall!.copyWith(
                        fontSize: 10,
                        color: context.lightOrang,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
