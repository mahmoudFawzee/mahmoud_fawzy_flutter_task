import 'package:get_it/get_it.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/cubit/get_packages_cubit.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/repo/packages_repo.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/cubit/get_products_cubit.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/repo/products_repo.dart';
import '/core/sql/local_storage.dart';
import '/features/categories/cubits/get_categories_cubit/get_categories_cubit.dart';
import '/features/categories/repo/categories_repo.dart';

import '../../features/categories/cubits/get_sub_categories_cubit/get_sub_categories_cubit.dart';
import '../sql/sqflite_client.dart';

part 'injection_container_impl.dart';
