import 'package:go_router/go_router.dart';

import '../../features/products/view/home_base.dart';
import '../../features/products/view/products_view.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: ProductsView.pageRoute,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomeBase(child: child);
        },
        routes: [
          GoRoute(
            path: ProductsView.pageRoute,
            builder: (context, state) => ProductsView(),
          ),
        ],
      ),
    ],
  );
}
