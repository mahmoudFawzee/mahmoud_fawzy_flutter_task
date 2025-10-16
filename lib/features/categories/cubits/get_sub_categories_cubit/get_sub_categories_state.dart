part of 'get_sub_categories_cubit.dart';

 class GetSubCategoriesState extends Equatable {
  final GetSubCategoriesStateEnum state;
  final String? message;
  final List<SubCategory>? categories;
  const GetSubCategoriesState(this.state, {this.message, this.categories});

  @override
  List<Object?> get props => [state, message, categories];
}

enum GetSubCategoriesStateEnum { initial, loading, noData, failure, success }
