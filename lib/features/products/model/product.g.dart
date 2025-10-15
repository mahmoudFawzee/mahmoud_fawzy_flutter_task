// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  subCategoryId: (json['subCategoryId'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toDouble(),
  hasOffer: json['hasOffer'] as bool,
  discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
  inCart: json['inCart'] as bool,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'categoryId': instance.categoryId,
  'subCategoryId': instance.subCategoryId,
  'imageUrl': instance.imageUrl,
  'price': instance.price,
  'hasOffer': instance.hasOffer,
  'discountedPrice': instance.discountedPrice,
  'inCart': instance.inCart,
};
