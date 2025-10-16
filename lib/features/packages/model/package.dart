import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mahmoudfawzy_flutter_task/core/parser/type_parser.dart';

part 'package.g.dart';

@JsonSerializable()
final class Package extends Equatable {
  @JsonKey(includeToJson: false)
  final int? id;
  final String? hint;
  final String name;
  final double price;
  final int availableForDays;
  @JsonKey(toJson: TypeParser.listToJson, fromJson: TypeParser.listFromJson)
  final List<String> features;
  const Package({
    this.id,
    this.hint,
    required this.name,
    required this.price,
    required this.availableForDays,
    required this.features,
  });
  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);

  Map<String, dynamic> toJson() => _$PackageToJson(this);

  static List<Package> fromJsonList(List json) =>
      json.map((item) => Package.fromJson(item)).toList();
  @override
  List<Object?> get props => [name, id];
}
