import 'package:dartz/dartz.dart';
import 'package:mahmoudfawzy_flutter_task/core/errors/exceptions.dart';
import 'package:mahmoudfawzy_flutter_task/core/errors/failures.dart';
import 'package:mahmoudfawzy_flutter_task/core/sql/constants/tables_names.dart';
import 'package:mahmoudfawzy_flutter_task/core/sql/local_storage.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/model/features_icons.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/model/package.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/model/package_feature.dart';

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
      TablesNames.packagesTable,
      _packages.map((package) => package.toJson()).toList(),
    );
  }

  static const _packages = [
    Package(name: 'أساسية', price: 3000, daysForExpiration: 30, features: []),
    Package(
      name: 'أكسترا',
      price: 3000,
      repeatingRatio: 7.0,
      daysForExpiration: 60,
      features: [
        PackageFeature(
          content: 'رفع لأعلى القائمة كل 3 أيام',
          icon: FeatureIconEnum.rocket,
        ),
        PackageFeature(
          content: 'تثبيت فى مقاول صحى',
          hint: '( خلال ال48 ساعة القادمة )',
          icon: FeatureIconEnum.pinned,
        ),
      ],
    ),
    Package(
      name: "بلس",
      price: 5500,
      daysForExpiration: 180,
      repeatingRatio: 18.0,
      bannerString: 'أفضل قيمة مقابل سعر',
      features: [
        PackageFeature(
          content: 'رفع لأعلى القائمة كل 2 يوم',
          icon: FeatureIconEnum.rocket,
        ),
        PackageFeature(
          content: 'ظهور فى كل محافظات مصر',
          icon: FeatureIconEnum.global,
        ),
        PackageFeature(content: 'أعلان مميز', icon: FeatureIconEnum.medal),
        PackageFeature(
          content: 'تثبيت فى مقاول صحى فى الجهراء',
          icon: FeatureIconEnum.pinned,
        ),
        PackageFeature(
          content: 'تثبيت فى مقاول صحى',
          hint: '( خلال ال48 ساعة القادمة )',
          icon: FeatureIconEnum.pinned,
        ),
      ],
    ),
    Package(
      name: "سوبر",
      price: 7000,
      bannerString: 'أعلى مشاهدات',
      daysForExpiration: 360,
      repeatingRatio: 24.0,
      features: [
        PackageFeature(
          content: 'رفع لأعلى القائمة كل 2 يوم',
          icon: FeatureIconEnum.rocket,
        ),
        PackageFeature(
          content: 'تثبيت فى مقاول صحى',
          hint: '( خلال ال48 ساعة القادمة )',
          icon: FeatureIconEnum.pinned,
        ),
        PackageFeature(
          content: 'ظهور فى كل محافظات مصر',
          icon: FeatureIconEnum.global,
        ),
        PackageFeature(content: 'أعلان مميز', icon: FeatureIconEnum.medal),
        PackageFeature(
          content: 'تثبيت فى مقاول صحى فى الجهراء',
          icon: FeatureIconEnum.pinned,
        ),
        PackageFeature(
          content: 'تثبيت فى مقاول صحى',
          hint: '( خلال ال48 ساعة القادمة )',
          icon: FeatureIconEnum.pinned,
        ),
      ],
    ),
  ];
}
