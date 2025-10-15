import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/products/model/product.dart';
import '/features/products/repo/products_repo.dart';
part 'get_products_state.dart';

final class GetProductsCubit extends Cubit<GetProductsState> {
  final ProductsRepo _repo;

  GetProductsCubit(this._repo)
    : super(GetProductsState(GetProductsStateEnum.initial));
  final List<Product> _productsList = [];
  bool isLoading = false;
  void _safeEmit(GetProductsState s) {
    if (!isClosed) {
      emit(s);
    }
  }

  Future getProduct() => _call();

  Future _call({bool reset = true}) async {
    if (reset) {
      _safeEmit(GetProductsState(GetProductsStateEnum.loading));
    } else {
      _safeEmit(GetProductsState(GetProductsStateEnum.loadMoreLoading));
    }

    final result = await _repo.getProduct(GetProductsParams(reset: reset));
    result.fold(
      (failure) {
        _safeEmit(
          GetProductsState(
            GetProductsStateEnum.failure,
            message: failure.errorMessage,
          ),
        );
      },
      (productList) {
        if (productList.isEmpty) {
          if (reset) {
            _safeEmit(GetProductsState(GetProductsStateEnum.noData));
          } else {
            _safeEmit(GetProductsState(GetProductsStateEnum.noMoreData));
          }
          return;
        }
        _productsList.addAll(productList);
        _safeEmit(
          GetProductsState(
            GetProductsStateEnum.success,
            products: [..._productsList],
          ),
        );
      },
    );
  }

  Future loadMoreProducts() => _call(reset: false);
}
