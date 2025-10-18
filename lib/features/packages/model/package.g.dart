// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
  id: (json['id'] as num?)?.toInt(),
  bannerString: json['bannerString'] as String?,
  repeatingRatio: (json['repeatingRatio'] as num?)?.toDouble() ?? 1,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  daysForExpiration: (json['daysForExpiration'] as num).toInt(),
  features: Package._decodeFeatures(json['features']),
);

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
  'bannerString': instance.bannerString,
  'name': instance.name,
  'price': instance.price,
  'repeatingRatio': instance.repeatingRatio,
  'daysForExpiration': instance.daysForExpiration,
  'features': Package._encodeFeatures(instance.features),
};
