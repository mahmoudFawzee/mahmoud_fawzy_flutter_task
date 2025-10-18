// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageFeature _$PackageFeatureFromJson(Map<String, dynamic> json) =>
    PackageFeature(
      icon: $enumDecode(_$FeatureIconEnumEnumMap, json['icon']),
      content: json['content'] as String,
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$PackageFeatureToJson(PackageFeature instance) =>
    <String, dynamic>{
      'content': instance.content,
      'hint': instance.hint,
      'icon': _$FeatureIconEnumEnumMap[instance.icon]!,
    };

const _$FeatureIconEnumEnumMap = {
  FeatureIconEnum.clock: 'clock',
  FeatureIconEnum.rocket: 'rocket',
  FeatureIconEnum.pinned: 'pinned',
  FeatureIconEnum.global: 'global',
  FeatureIconEnum.medal: 'medal',
};
