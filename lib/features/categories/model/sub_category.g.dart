// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
  categoryId: (json['categoryId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'categoryId': instance.categoryId,
    };
