import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    this.applyPadding = true,
    required this.onChanged,
  });
  final bool value;
  final bool applyPadding;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
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
          value: value,
          onChanged: onChanged,
        ),
        Text(
          'اكسترا',
          style: context.textStyles.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: value ? context.deepBlue : context.fontGrey,
          ),
        ),
      ],
    );
  }
}
