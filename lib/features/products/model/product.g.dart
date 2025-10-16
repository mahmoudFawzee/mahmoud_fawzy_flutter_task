// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  subCategoryId: (json['subCategoryId'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toDouble(),
  hasOffer: Product._intToBool(json['hasOffer']),
  discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
  inCart: json['inCart'] == null ? false : Product._intToBool(json['inCart']),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'name': instance.name,
  'categoryId': instance.categoryId,
  'subCategoryId': instance.subCategoryId,
  'imageUrl': instance.imageUrl,
  'price': instance.price,
  'hasOffer': Product._boolToInt(instance.hasOffer),
  'discountedPrice': instance.discountedPrice,
  'inCart': Product._boolToInt(instance.inCart),
};
