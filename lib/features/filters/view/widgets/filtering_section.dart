import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

import '../../../../config/shared/cubits/int_base_cubit.dart';

class FilteringSection extends StatelessWidget {
  const FilteringSection({
    super.key,
    required this.title,
    required this.items,
    required this.onSelect,
  });
  final String title;
  final List<String> items;
  final void Function(int item)? onSelect;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntBaseCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textStyles.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.fontGrey,
              ),
            ),
            const SizedBox(height: 3),

            Wrap(
              children: List.generate(
                items.length,
                (index) => FilteringItemWidget(
                  name: items[index],
                  index: index,
                  onTap: (id) {
                    onSelect?.call(id);
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class FilteringItemWidget extends StatelessWidget {
  const FilteringItemWidget({
    super.key,
    required this.name,
    required this.index,
    required this.onTap,
  });
  final String name;
  final int index;
  final void Function(int id)? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<IntBaseCubit>().chooseItem(index);
        onTap?.call(index);
      },
      child: BlocBuilder<IntBaseCubit, int?>(
        builder: (context, state) {
          final selected = state == index;
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: context.deepBlue.withValues(alpha: .05),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(
                color: selected ? context.deepBlue : context.greyBorder,
              ),
            ),
            child: Text(
              name,
              style: context.textStyles.bodyMedium!.copyWith(
                color: selected ? context.deepBlue : context.fontGrey,
              ),
            ),
          );
        },
      ),
    );
  }
}
