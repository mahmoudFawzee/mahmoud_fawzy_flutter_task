import 'package:json_annotation/json_annotation.dart';
import 'package:mahmoudfawzy_flutter_task/core/parser/type_parser.dart';

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
  @JsonKey(fromJson: TypeParser.intToBool, toJson: TypeParser.boolToInt)
  final bool hasOffer;
  final double? discountedPrice;
  @JsonKey(fromJson: TypeParser.intToBool, toJson: TypeParser.boolToInt)
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
}
