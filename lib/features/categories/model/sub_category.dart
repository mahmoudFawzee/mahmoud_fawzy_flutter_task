import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'sub_category.g.dart';

@JsonSerializable()
final class SubCategory extends Category {
  final int categoryId;
  const SubCategory({
    required this.categoryId,
    required super.id,
    required super.imageUrl,
    required super.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);

  static List<SubCategory> fromJsonList(List json) =>
      json.map((item) => SubCategory.fromJson(item)).toList();
  @override
  List<Object?> get props => [...super.props, categoryId];
}
