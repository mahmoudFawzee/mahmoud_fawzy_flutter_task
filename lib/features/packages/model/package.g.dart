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
  availableForDays: (json['availableForDays'] as num).toInt(),
  features: TypeParser.listFromJson(json['features']),
);

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
  'bannerString': instance.bannerString,
  'name': instance.name,
  'price': instance.price,
  'repeatingRatio': instance.repeatingRatio,
  'availableForDays': instance.availableForDays,
  'features': TypeParser.listToJson(instance.features),
};
