import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

import '../../../../config/resources/image_manger.dart';
import '../../../../l10n/app_localizations.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(appLocalizations.category),
        ),
        FilteringCategoryListTile(
          leadingImagePath: ImageManger.railStateIcon,
          title: 'عقارات',
          subTitle: 'فلل للبيع',
          trialing: GestureDetector(
            onTap: () {},
            child: Text(
              appLocalizations.change,
              style: context.textStyles.bodyMedium!.copyWith(
                color: context.deepBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilteringCategoryListTile extends StatelessWidget {
  const FilteringCategoryListTile({
    super.key,
    required this.leadingImagePath,
    required this.title,
    required this.subTitle,
    required this.trialing,
  });
  final String leadingImagePath, title, subTitle;
  final Widget trialing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(leadingImagePath),
        title: Text(
          title,
          style: context.textStyles.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: context.textStyles.bodySmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: context.fontGrey,
          ),
        ),
        trailing: trialing,
      ),
    );
  }
}
