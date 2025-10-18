import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/repo/packages_repo.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/repo/products_repo.dart';
import '/core/sql/local_storage.dart';
import '/features/categories/repo/categories_repo.dart';
import '/core/di/injection_container.dart';
import '/config/routes/navigation_cubit.dart';
import '/l10n/app_localizations.dart';
import '/config/theme/app_theme.dart';
import '/config/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //?get it init
  initDependencies();
  //?local sqflite data base init
  await sl.get<LocalStorageClient>().init();
  //?add local data
  await sl.get<CategoriesRepo>().addTestingCategories();
  await sl.get<CategoriesRepo>().addTestingSubCategories();
  await sl.get<ProductsRepo>().addClothes();
  await sl.get<ProductsRepo>().addWatches();
  await sl.get<PackagesRepo>().addTestingPackages();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 812),
        builder: (_, _) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('ar'),
          theme: AppTheme.appTheme,
          routerConfig: AppRoutes.router,
        ),
      ),
    );
  }
}
