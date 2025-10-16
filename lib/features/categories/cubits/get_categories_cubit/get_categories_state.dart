part of 'get_categories_cubit.dart';

class GetCategoriesState extends Equatable {
  final GetCategoriesStateEnum state;
  final String? message;
  final List<Category>? categories;
  const GetCategoriesState(this.state, {this.message, this.categories});

  @override
  List<Object?> get props => [state, message, categories];
}

enum GetCategoriesStateEnum { initial, loading, noData, failure, success }
