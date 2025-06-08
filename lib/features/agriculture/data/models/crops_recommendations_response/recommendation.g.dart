// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    Recommendation(
      area: (json['area'] as num?)?.toInt(),
      date: json['date'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      totalWaterUsage: json['total_water_usage'] as String?,
      waterUsagePerSqm: json['water_usage_per_sqm'] as String?,
    );

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date,
      'temperature': instance.temperature,
      'total_water_usage': instance.totalWaterUsage,
      'water_usage_per_sqm': instance.waterUsagePerSqm,
    };
