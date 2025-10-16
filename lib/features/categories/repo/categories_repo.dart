import 'package:dartz/dartz.dart';
import '/core/errors/exceptions.dart';
import '/core/errors/failures.dart';
import '/core/sql/constants/tables_names.dart';
import '../../../core/sql/local_storage.dart';
import '../model/category.dart';
import '../model/sub_category.dart';

final class CategoriesRepo {
  final LocalStorageClient _storageClient;
  const CategoriesRepo(this._storageClient);

  Future<Either<Failure, List<Category>>> getCategories() async =>
      await ExceptionsHandlerWrapper.call(
        () async => Category.fromJsonList(
          await _storageClient.getFullTable(TablesNames.categoriesTable),
        ),
      );

  Future<Either<Failure, List<SubCategory>>> getSubCategories() async =>
      await ExceptionsHandlerWrapper.call(
        () async => SubCategory.fromJsonList(
          await _storageClient.getFullTable(TablesNames.subCategoriesTable),
        ),
      );
}
