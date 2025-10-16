import 'package:flutter/material.dart';

import 'home_shimmer_loading.dart';

class DetailsScreenLoading extends StatelessWidget {
  const DetailsScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const LoadingContainer(width: double.infinity, height: 250),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return const LoadingContainer(height: 65, width: 70);
                }),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: List.generate(
              3,
              (_) => const LoadingContainer(width: 100, height: 20),
            ),
          ),
          const SizedBox(height: 25),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const LoadingContainer(width: 150, height: 20),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: List.generate(
                  4,
                  (_) => const LoadingContainer(width: 75, height: 25),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const LoadingContainer(width: 150, height: 20),
          const SizedBox(height: 25),

          const Flexible(
            child: LoadingContainer(width: double.infinity, height: 250),
          ),
        ],
      ),
    );
  }
}
