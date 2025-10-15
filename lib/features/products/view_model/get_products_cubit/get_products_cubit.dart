import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/model/product.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/repo/products_repo.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/view_model/get_products_cubit/get_products_state.dart';

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

  Future _call({bool loadMore = false}) async {
    if (loadMore) {
      _safeEmit(GetProductsState(GetProductsStateEnum.loadMoreLoading));
    } else {
      _safeEmit(GetProductsState(GetProductsStateEnum.loading));
    }

    final result = await _repo.getProduct();
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
          if (loadMore) {
            _safeEmit(GetProductsState(GetProductsStateEnum.noMoreData));
          }
          _safeEmit(GetProductsState(GetProductsStateEnum.noData));
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

  Future loadMoreProducts() => _call(loadMore: true);
}
