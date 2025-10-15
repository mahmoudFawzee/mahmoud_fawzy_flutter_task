import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/products/view/products_view.dart';

class NavigationCubit extends Cubit<int> {
  static const _routes = [ProductsView.pageRoute];
  static List<String> get routes => _routes;
  NavigationCubit() : super(1);

  navigateTo(int index) => emit(index);

  init() => emit(1);
}
