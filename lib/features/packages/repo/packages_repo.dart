import 'package:dartz/dartz.dart';
import 'package:mahmoudfawzy_flutter_task/core/errors/exceptions.dart';
import 'package:mahmoudfawzy_flutter_task/core/errors/failures.dart';
import 'package:mahmoudfawzy_flutter_task/core/sql/constants/tables_names.dart';
import 'package:mahmoudfawzy_flutter_task/core/sql/local_storage.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/model/package.dart';

final class PackagesRepo {
  final LocalStorageClient _client;
  const PackagesRepo(this._client);
  static const _tableName = TablesNames.packagesTable;
  Future<Either<Failure, List<Package>>> getPackages() async =>
      await ExceptionsHandlerWrapper.call(
        () async =>
            Package.fromJsonList(await _client.getFullTable(_tableName)),
      );
  Future addTestingPackages() async {
    await _client.insertRecords(
      TablesNames.productsTable,
      _packages.map((category) => category.toJson()).toList(),
    );
  }

  static const _packages = [
    Package(name: 'أساسية', price: 3000, availableForDays: 30, features: []),
    Package(
      name: 'أكسترا',
      price: 5000,
      repeatingRatio: 7.0,
      availableForDays: 60,
      features: [
        'رفع لأعلى القائمة كل 3 أيام',
        'تثبيت فى مقاول صحى',
        '( خلال ال48 ساعة القادمة )',
      ],
    ),
    Package(
      name: "بلس",
      price: 5500,
      availableForDays: 180,
      repeatingRatio: 18.0,
      bannerString: 'أفضل قيمة مقابل سعر',
      features: [
        'رفع لأعلى القائمة كل 3 أيام',
        'تثبيت فى مقاول صحى',
        '( خلال ال48 ساعة القادمة )',
        'ظهور فى كل محافظات مصر',
        'أعلان مميز',
        'تثبيت فى مقاول صحى فى الجهراء',
      ],
    ),
    Package(
      name: "سوبر",
      price: 7000,
      bannerString: 'أعلى مشاهدات',
      availableForDays: 360,
      repeatingRatio: 24.0,
      features: [
        'رفع لأعلى القائمة كل 3 أيام',
        'تثبيت فى مقاول صحى',
        '( خلال ال48 ساعة القادمة )',
        'ظهور فى كل محافظات مصر',
        'أعلان مميز',
        'تثبيت فى مقاول صحى فى الجهراء',
      ],
    ),
  ];
}
