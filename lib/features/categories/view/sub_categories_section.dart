import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
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
      child: BlocBuilder<GetSubCategoriesCubit, GetSubCategoriesState>(
        builder: (context, state) {
          return Skeletonizer(
            enabled: state.state == GetSubCategoriesStateEnum.loading,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: index == 0 ? 16 : 8),
                  child: Column(
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: CustomNetworkImage(
                          imgUrl:
                              'https://images.unsplash.com/photo-1615109398623-88346a601842?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
                          assetPlaceholder: ImageManger.loadingImage,
                          height: 56,
                          width: 73,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text('موضه رجالي', style: context.textStyles.bodySmall),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
