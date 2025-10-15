import 'package:equatable/equatable.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/model/product.dart';

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
