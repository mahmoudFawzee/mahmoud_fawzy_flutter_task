import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/cubits/int_base_cubit.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.onTap,
    this.isFirst = false,
    required this.index,
    this.isLast = false,
  });

  final String categoryName;
  final bool isLast;
  final int index;
  final bool isFirst;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntBaseCubit, int?>(
      builder: (context, state) {
        final isSelected = index == state;
        return GestureDetector(
          onTap: () {
            context.read<IntBaseCubit>().chooseItem(index);
            onTap?.call();
          },
          child: Container(
            margin: EdgeInsets.only(
              right: isFirst ? 16 : 8,
              left: isLast ? 16 : 8,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? context.deepOffWhite : context.primaryColor,
              border: Border.all(color: context.greyBorder),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Text(
              categoryName,
              style: context.textStyles.bodyMedium!.copyWith(
                color: isSelected ? context.lightOrang : context.fontGrey,
              ),
            ),
          ),
        );
      },
    );
  }
}
