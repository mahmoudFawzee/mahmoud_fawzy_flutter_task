import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/model/package_feature.dart';

part 'package.g.dart';

@JsonSerializable()
final class Package extends Equatable {
  @JsonKey(includeToJson: false)
  final int? id;
  final String? bannerString;
  final String name;
  final double price;
  final double repeatingRatio;
  final int daysForExpiration;
  @JsonKey(fromJson: _decodeFeatures, toJson: _encodeFeatures)
  final List<PackageFeature> features;
  const Package({
    this.id,
    this.bannerString,
    this.repeatingRatio = 1,
    required this.name,
    required this.price,
    required this.daysForExpiration,

    required this.features,
  });
  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);

  Map<String, dynamic> toJson() => _$PackageToJson(this);

  static List<Package> fromJsonList(List json) =>
      json.map((item) => Package.fromJson(item)).toList();
  @override
  List<Object?> get props => [name, id];

  static List<PackageFeature> _decodeFeatures(dynamic value) {
    if (value is String) {
      final List decoded = jsonDecode(value);
      return decoded.map((item) => PackageFeature.fromJson(item)).toList();
    } else if (value is List) {
      return value.map((item) => PackageFeature.fromJson(item)).toList();
    }
    return [];
  }

  static String _encodeFeatures(List<PackageFeature> features) =>
      jsonEncode(features.map((e) => e.toJson()).toList());
}
