import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
final class Product {
  @JsonKey(includeToJson: false)
  final int? id;
  final String name;
  final int categoryId;
  final int subCategoryId;
  final String imageUrl;
  final double price;
  @JsonKey(fromJson: _intToBool, toJson: _boolToInt)
  final bool hasOffer;
  final double? discountedPrice;
  @JsonKey(fromJson: _intToBool, toJson: _boolToInt)
  final bool inCart;
  const Product({
    this.id,
    required this.name,
    required this.categoryId,
    required this.subCategoryId,
    required this.imageUrl,
    required this.price,
    required this.hasOffer,
    this.discountedPrice,
    this.inCart = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  static List<Product> fromJsonList(List json) =>
      json.map((item) => Product.fromJson(item)).toList();

  static bool _intToBool(dynamic value) => value == 1;
  static int _boolToInt(bool value) => value ? 1 : 0;
}
