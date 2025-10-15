import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
final class Product {
  final int id;
  final String name;
  final int categoryId;
  final int subCategoryId;
  final String imageUrl;
  final double price;
  final bool hasOffer;
  final double? discountedPrice;
  final bool inCart;
  const Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.subCategoryId,
    required this.imageUrl,
    required this.price,
    required this.hasOffer,
    this.discountedPrice,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
