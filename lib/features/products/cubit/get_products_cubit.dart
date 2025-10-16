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

  void getProduct({int? subCategoryId}) async {
    _selectedSubCategoryId = subCategoryId;
    _productsList.clear();
    await _call();
  }

  Future _call({bool reset = true}) async {
    if (_isLoading) return;
    _isLoading = true;
    if (reset) {
      _safeEmit(const GetProductsState(GetProductsStateEnum.loading));
    } else {
      _safeEmit(const GetProductsState(GetProductsStateEnum.loadMoreLoading));
    }
    final result = await _repo.getProducts(
      GetProductsParams(reset: reset, subCategoryId: _selectedSubCategoryId),
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

  Future loadMoreProducts() async => await _call(reset: false);
}
