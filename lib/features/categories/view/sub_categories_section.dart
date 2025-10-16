import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/loading/loading/home_shimmer_loading.dart';
import '../../../config/shared/toast.dart';
import '/features/categories/cubits/get_sub_categories_cubit/get_sub_categories_cubit.dart';
import '/config/theme/app_theme.dart';
import '../../../config/resources/image_manger.dart';
import '../../../config/shared/custom_network_image.dart';

class SubCategoriesSection extends StatelessWidget {
  const SubCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: BlocConsumer<GetSubCategoriesCubit, GetSubCategoriesState>(
        listener: (context, state) {
          if (state.state == GetSubCategoriesStateEnum.failure) {
            CustomToast.showToast(state.message);
          }
        },
        buildWhen: (previous, current) {
          return [
            GetSubCategoriesStateEnum.loading,
            GetSubCategoriesStateEnum.noData,
            GetSubCategoriesStateEnum.success,
          ].contains(current.state);
        },
        builder: (context, state) {
          if (state.state == GetSubCategoriesStateEnum.loading) {
            return ListView.builder(
              itemBuilder: (_, _) {
                return const Column(
                  children: [
                    LoadingContainer(width: 73, height: 56),
                    LoadingContainer(width: 73, height: 14),
                  ],
                );
              },
            );
          } else if (state.state == GetSubCategoriesStateEnum.success) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories!.length,
              itemBuilder: (context, index) {
                final category = state.categories![index];
                return Container(
                  margin: EdgeInsets.only(right: index == 0 ? 16 : 8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        child: CustomNetworkImage(
                          imgUrl: category.imageUrl,
                          assetPlaceholder: ImageManger.loadingImage,
                          height: 56,
                          width: 73,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(category.name, style: context.textStyles.bodySmall),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
