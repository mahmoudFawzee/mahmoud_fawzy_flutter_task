import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/config/shared/cubits/int_base_cubit.dart';
import '/config/shared/loading/loading/home_shimmer_loading.dart';
import '/config/shared/toast.dart';
import 'package:mahmoudfawzy_flutter_task/l10n/app_localizations.dart';
import '/features/categories/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'widgets/category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.onSelect});

  ///if categoryId = -1 then get all products
  final Function(int categoryId)? onSelect;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntBaseCubit(initialValue: -1),
      child: Builder(
        builder: (context) {
          return SizedBox(
            height: 41,
            child: BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
              listener: (context, state) {
                if (state.state == GetCategoriesStateEnum.failure) {
                  CustomToast.showToast(state.message);
                }
              },
              buildWhen: (previous, current) {
                return [
                  GetCategoriesStateEnum.loading,
                  GetCategoriesStateEnum.noData,
                  GetCategoriesStateEnum.success,
                ].contains(current.state);
              },
              builder: (context, state) {
                if (state.state == GetCategoriesStateEnum.noData) {
                  return const SizedBox();
                }
                if (state.state == GetCategoriesStateEnum.loading) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return const LoadingContainer(
                        width: 90,
                        height: 40,
                        hMargin: 10,
                        radius: 4,
                      );
                    },
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      onTap: () => onSelect?.call(-1),
                      index: -1,
                      isFirst: true,
                      categoryName: AppLocalizations.of(context)!.allOffers,
                    ),

                    Flexible(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.categories!.length,
                        itemBuilder: (context, index) {
                          final category = state.categories![index];
                          log('category id: $category');
                          return CategoryCard(
                            onTap: () => onSelect?.call(category.id!),
                            index: index,
                            categoryName: category.name,
                            isLast: category == state.categories!.last,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
