import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '/core/errors/exceptions.dart';
import '/core/sql/constants/tables_names.dart';
import '/core/sql/local_storage.dart';
import '/features/products/model/product.dart';

import '../../../core/errors/failures.dart';

final class ProductsRepo {
  final LocalStorageClient _storageClient;
  ProductsRepo(this._storageClient);
  final tableName = TablesNames.productsTable;
  //?number of items in the one call
  int perPage = 10;
  //?the index of the item we start from
  //? if offset = 0 and per page = 10=>first 10 items=>from[0:10[
  //? if offset = 10 and per page = 10=>seconde 10 items=>from[10:20[
  int offset = 0;
  Future<Either<Failure, List<Product>>> getProduct(
    GetProductsParams params,
  ) async => await ExceptionsHandlerWrapper.call(() async {
    if (params.reset) offset = 0;
    final data = await _storageClient.getPaginatedRecords(
      tableName,
      recordFilter: RecordFiltering([]),
      offset: offset,
      perPage: perPage,
    );
    offset += perPage;
    return Product.fromJsonList(data);
  });
}

final class GetProductsParams extends Equatable {
  final bool reset;
  const GetProductsParams({this.reset = false});
  @override
  List<Object?> get props => [reset];
}
