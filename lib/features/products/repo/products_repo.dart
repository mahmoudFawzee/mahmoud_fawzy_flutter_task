import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mahmoudfawzy_flutter_task/core/sql/constants/keys.dart';
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
  Future<Either<Failure, List<Product>>> getProducts(
    GetProductsParams params,
  ) async => await ExceptionsHandlerWrapper.call(() async {
    if (params.reset) offset = 0;
    final data = await _storageClient.getPaginatedRecords(
      tableName,
      recordFilter: params.subCategoryId == null
          ? null
          : RecordFiltering([
              FilteringColumn(SqlKeys.subCategoryId, params.subCategoryId),
            ]),
      offset: offset,
      perPage: perPage,
    );
    offset += perPage;
    return Product.fromJsonList(data);
  });
  Future addClothes() async {
    await _addTestingProduct([..._clothes]);
  }

  Future addWatches() async {
    await _addTestingProduct([..._watches]);
  }

  Future _addTestingProduct(List<Product> products) async {
    await _storageClient.insertRecords(
      TablesNames.productsTable,
      products.map((category) => category.toJson()).toList(),
    );
  }

  static const _clothes = [
    Product(
      categoryId: 2,
      subCategoryId: 5,
      hasOffer: true,
      price: 5000554,
      discountedPrice: 5000000,

      imageUrl:
          'https://m.media-amazon.com/images/I/81+oQBvBR-L._AC_SX569_.jpg',
      name: 'قميص رجالي',
    ),
    Product(
      categoryId: 2,
      subCategoryId: 5,
      hasOffer: false,
      price: 5000554,
      discountedPrice: 5000000,
      imageUrl:
          'https://m.media-amazon.com/images/I/71YPH5q0MZL._AC_SX679_.jpg',
      name: 'تيشرت',
    ),
    Product(
      categoryId: 2,
      subCategoryId: 5,
      hasOffer: true,
      price: 5000554,
      discountedPrice: 200001,
      imageUrl:
          'https://m.media-amazon.com/images/I/617LZn+9zLL._AC_SY741_.jpg',
      name: 'بنطلون رجالي',
    ),
    Product(
      categoryId: 2,
      subCategoryId: 5,
      hasOffer: true,
      price: 5000554,
      discountedPrice: 5051487,
      imageUrl:
          'https://m.media-amazon.com/images/I/61ULA0mHnSL._AC_SX679_.jpg',
      name: 'skirt',
    ),
    Product(
      categoryId: 2,
      subCategoryId: 5,
      hasOffer: false,
      price: 5000554,
      discountedPrice: 5000000,
      imageUrl:
          'https://m.media-amazon.com/images/I/51lO5ii74zL._AC_SY741_.jpg',
      name: 'ترنج نسائي',
    ),
    Product(
      categoryId: 2,
      subCategoryId: 5,
      hasOffer: false,
      price: 5000554,
      discountedPrice: 5000000,
      imageUrl:
          'https://m.media-amazon.com/images/I/517Tys7oz-L._AC_SX569_.jpg',
      name: 'تيشرت رجالي',
    ),
  ];

  static const _watches = [
    Product(
      categoryId: 1,
      subCategoryId: 2,
      hasOffer: false,
      price: 1000233,
      discountedPrice: 12544,

      imageUrl:
          'https://m.media-amazon.com/images/I/51r4cs2+gFL._AC_SX679_.jpg',
      name: 'ساعه حريمي',
    ),
    Product(
      categoryId: 1,
      subCategoryId: 3,
      hasOffer: false,
      price: 52145,
      discountedPrice: 500002,
      imageUrl:
          'https://m.media-amazon.com/images/I/81LWsjyYoML._AC_SX522_.jpg',
      name: 'ساعه أبل',
    ),
    Product(
      categoryId: 1,
      subCategoryId: 1,
      hasOffer: true,
      price: 511120,
      discountedPrice: 200001,
      imageUrl:
          'https://m.media-amazon.com/images/I/61LDjgtVE3L._AC_SY741_.jpg',
      name: 'ساعه كاسيو',
    ),
    Product(
      categoryId: 1,
      subCategoryId: 2,
      hasOffer: true,
      price: 5000554,
      discountedPrice: 5051487,
      imageUrl:
          'https://m.media-amazon.com/images/I/61lGdiyOr7L._AC_SX679_.jpg',
      name: 'ساعه رولكس',
    ),
    Product(
      categoryId: 1,
      subCategoryId: 2,
      hasOffer: false,
      price: 5000554,
      discountedPrice: 5000000,
      imageUrl:
          'https://m.media-amazon.com/images/I/71b06JeLEHL._AC_SX679_.jpg',
      name: 'ساعه رويال',
    ),
    Product(
      categoryId: 1,
      subCategoryId: 3,
      hasOffer: false,
      price: 5000554,
      discountedPrice: 5000000,
      imageUrl:
          'https://m.media-amazon.com/images/I/41kxbA43k0L._AC_SX300_SY300_QL70_ML2_.jpg',
      name: 'ساعه سامسونج',
    ),
  ];
}

final class GetProductsParams extends Equatable {
  final bool reset;
  final int? subCategoryId;
  const GetProductsParams({this.reset = false, this.subCategoryId});
  @override
  List<Object?> get props => [reset, subCategoryId];
}

const demoProduct = Product(
  name: 'name',
  categoryId: 0,
  subCategoryId: 0,
  imageUrl: 'imageUrl',
  price: 500000,
  hasOffer: false,
);
