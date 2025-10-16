import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahmoudfawzy_flutter_task/features/categories/cubits/get_sub_categories_cubit/get_sub_categories_cubit.dart';
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
          CategoriesSection(
            onSelect: (categoryId) {
              context.read<GetSubCategoriesCubit>().getSubCategories(
                categoryId: categoryId,
              );
            },
          ),
          const SizedBox(height: 25),
          SubCategoriesSection(
            onSelect: (subCategoryId) {
              log('sub id: $subCategoryId');
            },
          ),
          const SizedBox(height: 25),
          FreeDeliveryBanner(appLocalizations: appLocalizations),
          //const SizedBox(height: 25),
          const ProductsSection(),
        ],
      ),
    );
  }
}
