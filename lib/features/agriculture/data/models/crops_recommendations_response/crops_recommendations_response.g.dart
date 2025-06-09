// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crops_recommendations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CropsRecommendationsResponse _$CropsRecommendationsResponseFromJson(
  Map<String, dynamic> json,
) => CropsRecommendationsResponse(
  recommendations:
      (json['recommendations'] as List<dynamic>)
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CropsRecommendationsResponseToJson(
  CropsRecommendationsResponse instance,
) => <String, dynamic>{'recommendations': instance.recommendations};
