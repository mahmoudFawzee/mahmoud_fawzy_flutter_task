import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/features/categories/view/categories_section.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/view/widgets/free_delivery_banner.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/view/widgets/products_page_leading.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/view/widgets/products_section.dart';
import 'package:mahmoudfawzy_flutter_task/features/categories/view/sub_categories_section.dart';
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
          CategoriesSection(onSelect: (categoryId) {}),
          const SizedBox(height: 25),
          const SubCategoriesSection(),
          const SizedBox(height: 25),
          FreeDeliveryBanner(appLocalizations: appLocalizations),
          //const SizedBox(height: 25),
          const ProductsSection(),
        ],
      ),
    );
  }
}
