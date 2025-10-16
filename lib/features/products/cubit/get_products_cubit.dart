import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/products/model/product.dart';
import '/features/products/repo/products_repo.dart';
part 'get_products_state.dart';

final class GetProductsCubit extends Cubit<GetProductsState> {
  final ProductsRepo _repo;

  GetProductsCubit(this._repo)
    : super(const GetProductsState(GetProductsStateEnum.initial));
  final List<Product> _productsList = [];
  bool _isLoading = false;
  int? _selectedSubCategoryId;
  void _safeEmit(GetProductsState s) {
    if (!isClosed) {
      emit(s);
    }
  }

  void getProduct({int? subCategoryId}) {
    _selectedSubCategoryId = subCategoryId;
    _call(subCategoryId: subCategoryId);
  }

  Future _call({bool reset = true, int? subCategoryId}) async {
    if (_isLoading) return;
    if (reset) {
      _productsList.clear;
      _safeEmit(const GetProductsState(GetProductsStateEnum.loading));
    } else {
      _safeEmit(const GetProductsState(GetProductsStateEnum.loadMoreLoading));
    }
    await Future.delayed(const Duration(seconds: 1, microseconds: 500));
    _isLoading = true;
    final result = await _repo.getProduct(
      GetProductsParams(reset: reset, subCategoryId: subCategoryId),
    );
    _isLoading = false;
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
            _safeEmit(const GetProductsState(GetProductsStateEnum.noData));
          } else {
            _safeEmit(const GetProductsState(GetProductsStateEnum.noMoreData));
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

  Future loadMoreProducts() =>
      _call(reset: false, subCategoryId: _selectedSubCategoryId);
}
