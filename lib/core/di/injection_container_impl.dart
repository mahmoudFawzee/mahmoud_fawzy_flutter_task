part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _setupHelpers();
}

void _setupHelpers() {
  sl.registerSingleton<LocalStorageClient>(SqfliteClient());
}

void setUpCategories() {
  sl.registerLazySingleton(() => CategoriesRepo(sl.get()));
  sl.registerFactory(() => GetCategoriesCubit(sl.get()));
  sl.registerFactory(() => GetSubCategoriesCubit(sl.get()));
}
