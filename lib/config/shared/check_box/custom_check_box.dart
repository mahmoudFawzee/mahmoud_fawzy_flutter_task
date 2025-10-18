import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/cubits/bool_based_cubit.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.initialValue,
    required this.label,
    this.applyPadding = true,
    required this.onChanged,
  });
  final bool initialValue;
  final bool applyPadding;
  final String label;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoolBasedCubit(isSelected: initialValue),
      child: Builder(
        builder: (context) {
          final cubit = context.read<BoolBasedCubit>();
          return BlocBuilder<BoolBasedCubit, bool>(
            builder: (context, state) {
              return Row(
                children: [
                  Checkbox(
                    materialTapTargetSize: applyPadding
                        ? null
                        : MaterialTapTargetSize.shrinkWrap,
                    visualDensity: applyPadding ? null : VisualDensity.compact,
                    checkColor: context.white,
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return context.deepBlue;
                      }
                      return Colors.white;
                    }),
                    value: state,
                    onChanged: (value) {
                      if (value == true) {
                        cubit.changeToTrue();
                      } else {
                        cubit.changeToFalse();
                      }
                      onChanged?.call(value);
                    },
                  ),
                  Text(
                    label,
                    style: context.textStyles.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: state ? context.deepBlue : context.fontGrey,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
