import 'package:dartz/dartz.dart';
import 'package:mahmoudfawzy_flutter_task/core/errors/exceptions.dart';
import 'package:mahmoudfawzy_flutter_task/core/sql/constants/tables_names.dart';
import 'package:mahmoudfawzy_flutter_task/core/sql/local_storage.dart';
import 'package:mahmoudfawzy_flutter_task/features/products/model/product.dart';

import '../../../core/errors/failures.dart';

final class ProductsRepo {
  final LocalStorageClient _storageClient;
  const ProductsRepo(this._storageClient);
  final tableName = TablesNames.productsTable;
  Future<Either<Failure, List<Product>>> getProduct() async =>
      await ExceptionsHandlerWrapper.call(
        () async =>
            Product.fromJsonList(await _storageClient.getFullTable(tableName)),
      );
}
