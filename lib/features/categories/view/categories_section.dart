import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/loading/loading/home_shimmer_loading.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/toast.dart';
import '/features/categories/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '/config/theme/app_theme.dart';

import '../../../l10n/app_localizations.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
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
            return Skeletonizer(
              enabled: true,
              child: ListView.builder(
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
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories!.length,
            itemBuilder: (context, index) {
              final category = state.categories![index];
              return Container(
                margin: EdgeInsets.only(
                  right: index == 0 ? 16 : 8,
                  left: category == state.categories!.last ? 16 : 8,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.deepOffWhite,
                  border: Border.all(color: context.greyBorder),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Text(
                  category.name,
                  style: context.textStyles.bodyMedium!.copyWith(
                    color: index == 0 ? context.lightOrang : context.fontGrey,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
