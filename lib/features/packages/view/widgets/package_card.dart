import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

import '../../../../config/shared/check_box/custom_check_box.dart';
import '../triangle_clip_path.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),

      child: Stack(
        children: [
          //?content
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.greyBorder),
                boxShadow: [
                  BoxShadow(
                    color: context.greyBorder,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCheckBox(
                        applyPadding: false,
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        '3000ج.م',
                        style: context.textStyles.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.deepOrange,
                          decoration: TextDecoration.underline,
                          decorationThickness: 25,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ...List.generate(5, (index) {
                            return Text('feature $index');
                          }),
                        ],
                      ),
                      //if features is not empty
                      const Text('data', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //?this is the banner
          Positioned(
            top: 0,
            right: 0,
            child: ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                height: 31,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: context.extraLightOrange,

                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 4,
                  ),

                  alignment: Alignment.centerRight,
                  child: Text(
                    'أفضل قيمة مقابل سعر',

                    style: context.textStyles.displaySmall!.copyWith(
                      fontSize: 10,
                      color: context.lightOrang,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
