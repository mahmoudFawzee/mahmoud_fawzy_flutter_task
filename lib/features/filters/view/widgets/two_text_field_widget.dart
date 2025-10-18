import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

class TwoTextFieldsWidget extends StatelessWidget {
  const TwoTextFieldsWidget({
    super.key,
    required this.title,
    required this.firstBoxHint,
    required this.secondBoxHint,
    required this.onFirstFieldChanged,
    required this.onSecondFieldChanged,
  });
  final String title;
  final String firstBoxHint, secondBoxHint;
  final void Function(String value)? onFirstFieldChanged, onSecondFieldChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            title,
            style: context.textStyles.bodyLarge!.copyWith(
              color: context.fontGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 48.h,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: firstBoxHint,
                    onChanged: (value) => onFirstFieldChanged?.call(value),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    hint: secondBoxHint,
                    onChanged: (value) => onSecondFieldChanged?.call(value),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.onChanged,
  });
  final String hint;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hint: Text(
          hint,
          style: context.textStyles.bodyMedium!.copyWith(
            color: context.fontGrey,
            fontWeight: FontWeight.w500,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.greyBorder),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
