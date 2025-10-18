import 'package:flutter/material.dart';

class TwoTextFieldsWidget extends StatelessWidget {
  const TwoTextFieldsWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const SizedBox(height: 10),
        const Row(children: [TextField(), TextField()]),
      ],
    );
  }
}
