import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/loading/loading/home_shimmer_loading.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/toast.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/cubit/get_products_cubit.dart';
import '/features/products/view/widgets/product_card.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<GetProductsCubit, GetProductsState>(
        listener: (context, state) {
          if (state.state == GetProductsStateEnum.failure) {
            CustomToast.showToast(state.message);
          }
        },
        buildWhen: (previous, current) {
          return [
            GetProductsStateEnum.success,
            GetProductsStateEnum.noData,
            GetProductsStateEnum.loading,
          ].contains(current.state);
        },
        builder: (context, state) {
          if (state.state == GetProductsStateEnum.loading) {
            return const LoadingGridView();
          }
          if (state.state == GetProductsStateEnum.success) {
            final products = state.products;
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  //?we need to know does we get product from specific category or not
                  context.read<GetProductsCubit>().loadMoreProducts();
                }
                return true;
              },
              child: GridView.builder(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 25,
                  bottom: 16,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 3.7 / 8,
                ),
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class LoadingGridView extends StatelessWidget {
  const LoadingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 25, bottom: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 4 / 8,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const LoadingContainer(height: 158, width: 360);
      },
    );
  }
}
