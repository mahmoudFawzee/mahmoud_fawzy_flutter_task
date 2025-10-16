import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/features/categories/repo/categories_repo.dart';
import '/features/categories/model/category.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final CategoriesRepo _repo;
  GetCategoriesCubit(this._repo)
    : super(const GetCategoriesState(GetCategoriesStateEnum.initial));

  _safeEmit(GetCategoriesState s) {
    if (!isClosed) {
      emit(s);
    }
  }

  void getCategories() async {
    _safeEmit(const GetCategoriesState(GetCategoriesStateEnum.loading));
    final result = await _repo.getCategories();
    result.fold(
      (failure) {
        _safeEmit(
          GetCategoriesState(
            GetCategoriesStateEnum.failure,
            message: failure.errorMessage,
          ),
        );
      },
      (categories) {
        if (categories.isEmpty) {
          _safeEmit(const GetCategoriesState(GetCategoriesStateEnum.noData));
          return;
        }
        _safeEmit(
          GetCategoriesState(
            GetCategoriesStateEnum.success,
            categories: categories,
          ),
        );
      },
    );
  }

}
