import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/features/categories/repo/categories_repo.dart';
import '/features/categories/model/sub_category.dart';

part 'get_sub_categories_state.dart';

class GetSubCategoriesCubit extends Cubit<GetSubCategoriesState> {
  final CategoriesRepo _repo;
  GetSubCategoriesCubit(this._repo)
    : super(const GetSubCategoriesState(GetSubCategoriesStateEnum.initial));

  _safeEmit(GetSubCategoriesState s) {
    if (!isClosed) {
      emit(s);
    }
  }

  void getSubCategories({
    int? categoryId,
    bool getSubCategoryProducts = false,
  }) async {
    _safeEmit(const GetSubCategoriesState(GetSubCategoriesStateEnum.loading));
    final result = await _repo.getSubCategories(categoryId: categoryId);
    result.fold(
      (failure) {
        _safeEmit(
          GetSubCategoriesState(
            GetSubCategoriesStateEnum.failure,
            message: failure.errorMessage,
          ),
        );
      },
      (categories) {
        if (categories.isEmpty) {
          _safeEmit(
            const GetSubCategoriesState(GetSubCategoriesStateEnum.noData),
          );
          return;
        }
        _safeEmit(
          GetSubCategoriesState(
            GetSubCategoriesStateEnum.success,
            isFirstCall: getSubCategoryProducts,
            categories: categories,
          ),
        );
      },
    );
  }
}
