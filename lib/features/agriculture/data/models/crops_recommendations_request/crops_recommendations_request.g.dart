// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crops_recommendations_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CropsRecommendationsRequest _$CropsRecommendationsRequestFromJson(
  Map<String, dynamic> json,
) => CropsRecommendationsRequest(
  crop: json['crop'] as String?,
  area: (json['area'] as num?)?.toInt(),
  weeklyWeatherData:
      (json['weekly_weather_data'] as List<dynamic>?)
          ?.map((e) => WeeklyWeatherDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CropsRecommendationsRequestToJson(
  CropsRecommendationsRequest instance,
) => <String, dynamic>{
  'crop': instance.crop,
  'area': instance.area,
  'weekly_weather_data': instance.weeklyWeatherData,
};
