part of 'get_products_cubit.dart';

final class GetProductsState extends Equatable {
  final GetProductsStateEnum state;
  final String? message;
  final List<Product>? products;
  const GetProductsState(this.state, {this.message, this.products});
  @override
  List<Object?> get props => [state, message, products];
}

enum GetProductsStateEnum {
  initial,
  loading,
  loadMoreLoading,
  noData,
  noMoreData,
  failure,
  success,
}
