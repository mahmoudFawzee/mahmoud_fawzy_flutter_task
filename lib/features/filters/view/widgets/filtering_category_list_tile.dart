import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/resources/image_manger.dart';
import '../../../../l10n/app_localizations.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(appLocalizations.category),
        FilteringCategoryListTile(
          leadingImagePath: ImageManger.railStateIcon,
          title: 'عقارات',
          subTitle: 'فلل للبيع',
          trialing: GestureDetector(
            onTap: () {},
            child: Text(appLocalizations.change),
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
    return ListTile(
      leading: SvgPicture.asset(ImageManger.railStateIcon),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: trialing,
    );
  }
}
