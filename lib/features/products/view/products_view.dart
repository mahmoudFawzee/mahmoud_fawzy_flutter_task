import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/categories/cubits/get_sub_categories_cubit/get_sub_categories_cubit.dart';
import '/features/categories/view/categories_section.dart';
import '/features/products/cubit/get_products_cubit.dart';
import '/features/products/view/widgets/free_delivery_banner.dart';
import '/features/products/view/widgets/products_page_leading.dart';
import '/features/products/view/widgets/products_section.dart';
import '/features/categories/view/sub_categories_section.dart';
import '/l10n/app_localizations.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const pageRoute = '/products-screen';

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      //?here when we get sub categories under some category we will get the first category items
      body: BlocListener<GetSubCategoriesCubit, GetSubCategoriesState>(
        listener: (context, state) {
          if (state.state == GetSubCategoriesStateEnum.success) {
            context.read<GetProductsCubit>().getProduct(
              subCategoryId: state.categories!.first.id,
            );
          }
        },
        child: Column(
          children: [
            const SizedBox(height: 45),
            PageLeading(appLocalizations: appLocalizations),
            const SizedBox(height: 10),
            CategoriesSection(
              onSelect: (categoryId) {
                if (categoryId == null) {
                  context.read<GetProductsCubit>().getProduct(
                    subCategoryId: null,
                  );
                  return;
                }
                context.read<GetSubCategoriesCubit>().getSubCategories(
                  categoryId: categoryId,
                );
              },
            ),
            const SizedBox(height: 25),
            SubCategoriesSection(
              onSelect: (subCategoryId) {
                log('sub id: $subCategoryId');
                context.read<GetProductsCubit>().getProduct(
                  subCategoryId: subCategoryId,
                );
              },
            ),
            const SizedBox(height: 25),
            FreeDeliveryBanner(appLocalizations: appLocalizations),
            //const SizedBox(height: 25),
            const ProductsSection(),
          ],
        ),
      ),
    );
  }
}
