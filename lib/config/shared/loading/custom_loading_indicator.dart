import 'package:flutter/material.dart';

import '../../theme/colors_manger.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.widgetHeight, this.color});
  final double? widgetHeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    if (widgetHeight == null) {
      return const Center(
        child: CircularProgressIndicator(color: ColorsManger.black),
      );
    }
    return SizedBox(
      height: widgetHeight,
      child: const Center(
        child: CircularProgressIndicator(color: ColorsManger.black),
      ),
    );
  }
}
