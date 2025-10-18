import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/model/features_icons.dart';
part 'package_feature.g.dart';

@JsonSerializable()
final class PackageFeature extends Equatable {
  final String content;
  final String? hint;
  final FeatureIconEnum icon;
  const PackageFeature({required this.icon, required this.content, this.hint});

  factory PackageFeature.fromJson(Map<String, dynamic> json) =>
      _$PackageFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$PackageFeatureToJson(this);

  static List<PackageFeature> fromJsonList(List json) =>
      json.map((item) => PackageFeature.fromJson(item)).toList();
  @override
  List<Object?> get props => [hint, content];
}
