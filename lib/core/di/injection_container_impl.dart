part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _setupHelpers();
  _setUpCategories();
  _setUpProducts();
}

void _setupHelpers() {
  sl.registerSingleton<LocalStorageClient>(SqfliteClient());
}

void _setUpCategories() {
  sl.registerLazySingleton(() => CategoriesRepo(sl.get()));
  sl.registerFactory(() => GetCategoriesCubit(sl.get()));
  sl.registerFactory(() => GetSubCategoriesCubit(sl.get()));
}

void _setUpProducts() {
  sl.registerLazySingleton(() => ProductsRepo(sl.get()));
  sl.registerFactory(() => GetProductsCubit(sl.get()));
}
