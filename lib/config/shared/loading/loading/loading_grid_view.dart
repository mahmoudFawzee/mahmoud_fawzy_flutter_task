import 'package:flutter/material.dart';
import 'home_shimmer_loading.dart';

class LoadingGridView extends StatelessWidget {
  const LoadingGridView({
    super.key,
    required this.title,
    this.isSearch = false,
  });
  final String? title;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSearch) const LoadingContainer(width: 150, height: 20),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 5,
                childAspectRatio: 3 / 3.8,
              ),
              itemBuilder: (context, index) {
                return const LoadingServiceCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
