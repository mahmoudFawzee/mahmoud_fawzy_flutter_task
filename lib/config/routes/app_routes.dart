import 'package:go_router/go_router.dart';

// AppRoutes class with GoRouter instance
class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: ProductsView.pageRoute,
    routes: [
      GoRoute(
        path: ProductsView.pageRoute,
        builder: (context, state) => ProductsView(),
      ),
    ],
  );
}
