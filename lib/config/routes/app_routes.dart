import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mahmoudfawzy_flutter_task/features/filters/view/filtering_screen.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/cubit/get_packages_cubit.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/view/packages_view.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/cubit/get_products_cubit.dart';
import '../../features/categories/cubits/get_sub_categories_cubit/get_sub_categories_cubit.dart';
import '/core/di/injection_container.dart';
import '/features/categories/cubits/get_categories_cubit/get_categories_cubit.dart';

import '../../features/products/view/home_base.dart';
import '../../features/products/view/products_view.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: PackagesScreen.pageRoute,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomeBase(child: child);
        },
        routes: [
          GoRoute(
            path: ProductsView.pageRoute,
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      sl.get<GetCategoriesCubit>()..getCategories(),
                ),
                BlocProvider(
                  create: (context) =>
                      sl.get<GetSubCategoriesCubit>()..getSubCategories(),
                ),
                BlocProvider(
                  create: (context) => sl.get<GetProductsCubit>()..getProduct(),
                ),
              ],
              child: const ProductsView(),
            ),
          ),
        ],
      ),

      GoRoute(
        path: PackagesScreen.pageRoute,
        builder: (_, _) => BlocProvider(
          create: (context) => sl.get<GetPackagesCubit>()..getPackages(),
          child: const PackagesScreen(),
        ),
      ),
      GoRoute(
        path: FilteringScreen.pageRoute,
        builder: (_, _) => const FilteringScreen(),
      ),
    ],
  );
}
