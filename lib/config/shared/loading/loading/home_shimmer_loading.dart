import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shimmer_loading.dart';


class SectionBodyLoading extends StatelessWidget {
  const SectionBodyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 186.h,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, _) {
          return const LoadingServiceCard();
        },
      ),
    );
  }
}

class LoadingServiceCard extends StatelessWidget {
  const LoadingServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingContainer(
      width: 158.w,
      height: 186.h,
      hMargin: 5,
      radius: 10,
    );
  }
}

class SectionHeaderLoading extends StatelessWidget {
  const SectionHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoadingContainer(width: 140, height: 28, hMargin: 5),
        LoadingContainer(width: 70, height: 22, hMargin: 5),
      ],
    );
  }
}

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
    required this.width,
    required this.height,
    this.radius = 0,
    this.hMargin,
    this.vMargin,
  });

  final double width;
  final double height;
  final double radius;
  final double? vMargin;
  final double? hMargin;
  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: hMargin ?? 0,
          vertical: vMargin ?? 0,
        ),
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
    );
  }
}

class SearchBoxLoading extends StatelessWidget {
  const SearchBoxLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingContainer(height: 48, width: 330, radius: 10);
  }
}
