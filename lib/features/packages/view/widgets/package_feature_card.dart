import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.content,
    required this.iconPath,
    this.hint,
  });

  final String content;
  final String iconPath;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content,
                style: context.textStyles.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (hint != null)
                Text(
                  hint!,
                  style: context.textStyles.bodyMedium!.copyWith(
                    color: context.errorColor,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
