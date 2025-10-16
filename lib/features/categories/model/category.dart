import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  @JsonKey(includeToJson: false)
  final int? id;
  final String imageUrl;
  final String name;
  const Category({this.id, required this.imageUrl, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  static List<Category> fromJsonList(List json) =>
      json.map((item) => Category.fromJson(item)).toList();

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return 'id: $id, name: $name, imageUrl: $imageUrl';
  }
}
