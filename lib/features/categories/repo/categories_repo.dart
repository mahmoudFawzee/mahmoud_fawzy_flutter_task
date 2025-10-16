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

  Future addTestingCategories() async {
    await _storageClient.insertRecords(
      TablesNames.categoriesTable,
      [
        const Category(imageUrl: '', name: 'ساعات'),
        const Category(imageUrl: '', name: 'ملابس'),
        const Category(imageUrl: '', name: 'اكسسوارات'),
        const Category(imageUrl: '', name: 'موبايلات'),
        const Category(imageUrl: '', name: 'اجهزه كهربائيه'),
        const Category(imageUrl: '', name: 'احذيه'),
      ].map((category) => category.toJson()).toList(),
    );
  }

  Future addTestingSubCategories() async {
    await _storageClient.insertRecords(
      TablesNames.subCategoriesTable,
      [
        //watches
        ...[
          const SubCategory(
            categoryId: 1,
            imageUrl:
                'https://img.chrono24.com/images/uhren/43172858-92a4qog9blbsls68halahwwr-Square280.jpg',
            name: 'كرونو بيك',
          ),
          const SubCategory(
            categoryId: 1,
            imageUrl:
                'https://img.chrono24.com/images/uhren/39407530-3b4507l1wbnt0cafziwcfb22-Square280.jpg',
            name: 'تايم أورا',
          ),
          const SubCategory(
            categoryId: 1,
            imageUrl:
                'https://img.chrono24.com/images/uhren/42316663-r2dr09ibqqd4yrkh3odg9dw7-Square280.jpg',
            name: 'لاكس مومنت',
          ),
          const SubCategory(
            categoryId: 1,
            imageUrl:
                'https://img.chrono24.com/images/uhren/42911757-mlwghj5gf8qsn7kfk5w6349a-Square280.jpg',
            name: 'إيكلا هورلجيري',
          ),
        ],
        //clothes
        ...[
          const SubCategory(
            categoryId: 2,
            imageUrl:
                'https://is4.revolveassets.com/images/p4/n/uv/HLSA-WO63_V1.jpg',
            name: 'Revolve',
          ),
          const SubCategory(
            categoryId: 2,
            imageUrl:
                "https://cdn-images.farfetch-contents.com/30/58/52/46/30585246_60311802_1000.jpg",
            name: 'ASOS',
          ),
          const SubCategory(
            categoryId: 2,
            imageUrl:
                'https://cdn-images.farfetch-contents.com/24/40/76/25/24407625_57082815_1000.jpg',
            name: 'FARFETCH',
          ),
          const SubCategory(
            categoryId: 2,
            imageUrl:
                'https://cdn-images.farfetch-contents.com/30/58/63/07/30586307_59566681_1000.jpg',
            name: 'NET-A-PORTER',
          ),
          const SubCategory(
            categoryId: 2,
            imageUrl:
                'https://cdn-images.farfetch-contents.com/30/58/54/04/30585404_59648065_1000.jpg',
            name: 'H&M',
          ),
          const SubCategory(
            categoryId: 2,
            imageUrl:
                'https://cdn-images.farfetch-contents.com/30/58/53/32/30585332_60836276_1000.jpg',
            name: 'About You',
          ),
          const SubCategory(
            categoryId: 2,
            imageUrl:
                'https://cdn-images.farfetch-contents.com/30/58/61/49/30586149_59744352_1000.jpg',
            name: 'Thom Browne',
          ),
        ],

        //accessories
        ...[
          const SubCategory(
            categoryId: 3,
            imageUrl:
                'https://cdn-images.farfetch-contents.com/31/50/64/57/31506457_61005708_1000.jpg',
            name: 'Hats',
          ),
          const SubCategory(
            categoryId: 3,
            imageUrl:
                'https://www.mytheresa.com/media/1094/1238/100/7d/P01088827.jpg',
            name: 'Mytheresa',
          ),
          const SubCategory(
            categoryId: 3,
            imageUrl:
                'https://www.mytheresa.com/media/1094/1238/100/49/P01111587.jpg',
            name: 'نظارات',
          ),
          const SubCategory(
            categoryId: 3,
            imageUrl:
                'https://www.mytheresa.com/media/1094/1238/100/f5/P01070994.jpg',
            name: 'naMaison Margielame',
          ),
          const SubCategory(
            categoryId: 3,
            imageUrl:
                'https://www.mytheresa.com/media/1094/1238/100/43/P01071067.jpg',
            name: 'naAlexander Wangme',
          ),
        ],
        //phones
        ...[
          const SubCategory(
            categoryId: 4,
            imageUrl:
                'https://m.media-amazon.com/images/I/61VuVU94RnL._AC_SY300_SX300_QL70_ML2_.jpg',
            name: 'Apple',
          ),
          const SubCategory(
            categoryId: 4,
            imageUrl:
                'https://m.media-amazon.com/images/I/61Lp1UcxeLL._AC_SX522_.jpg',
            name: 'Samsung',
          ),
          const SubCategory(
            categoryId: 4,
            imageUrl:
                'https://m.media-amazon.com/images/I/71AZ1K-WgpL._AC_SY300_SX300_QL70_ML2_.jpg',
            name: 'Xiaomi',
          ),
          const SubCategory(
            categoryId: 4,
            imageUrl:
                'https://m.media-amazon.com/images/I/61cJh--apcL._AC_SY300_SX300_QL70_ML2_.jpg',
            name: 'Huawei',
          ),
          const SubCategory(
            categoryId: 4,
            imageUrl:
                'https://m.media-amazon.com/images/I/61fh21u3DJL._AC_SY300_SX300_QL70_ML2_.jpg',
            name: 'Google',
          ),
          const SubCategory(
            categoryId: 4,
            imageUrl:
                'https://m.media-amazon.com/images/I/715k0WQtg9L._AC_SY300_SX300_QL70_ML2_.jpg',
            name: 'OnePlus',
          ),
        ],
      ].map((category) => category.toJson()).toList(),
    );
  }
}
