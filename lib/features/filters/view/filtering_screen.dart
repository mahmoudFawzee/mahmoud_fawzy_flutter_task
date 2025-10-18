import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mahmoudfawzy_flutter_task/config/resources/image_manger.dart';
import 'package:mahmoudfawzy_flutter_task/features/filters/view/widgets/filtering_category_list_tile.dart';
import 'package:mahmoudfawzy_flutter_task/features/filters/view/widgets/two_text_field_widget.dart';
import 'package:mahmoudfawzy_flutter_task/l10n/app_localizations.dart';

import 'widgets/filtering_section.dart';

class FilteringScreen extends StatelessWidget {
  const FilteringScreen({super.key});
  static const pageRoute = '/filter-screen';

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close),
        ),
        title: Text(appLocalizations.filtering),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Text(appLocalizations.backToDefault),
          ),
        ],
      ),
      body: Column(
        children: [
          const CategorySection(),
          const Divider(),
          FilteringCategoryListTile(
            leadingImagePath: ImageManger.locationOnIcon,
            title: appLocalizations.location,
            subTitle: 'مصر',
            trialing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(),
          TwoTextFieldsWidget(title: appLocalizations.monthlyPayments),
          FilteringSection(
            title: 'النوع',
            items: const ['الكل', 'توين هاوس', 'فيلا منفصله', 'تاون هاوس'],
            onSelect: (item) {},
          ),
          FilteringSection(
            title: 'عدد الغرف',
            items: const ['الكل', 'غرفتين', '3 غرف', '4 غرف', '5 غرف+'],
            onSelect: (item) {},
          ),
          TwoTextFieldsWidget(title: appLocalizations.price),
          FilteringSection(
            title: 'طريقه الدفع',
            items: const ['أي', 'تقسيط', 'كاش'],
            onSelect: (item) {},
          ),
          FilteringSection(
            title: 'حاله العقار',
            items: const ['أي', 'جاهز', 'قيد الانشاء'],
            onSelect: (item) {},
          ),
        ],
      ),
    );
  }
}
