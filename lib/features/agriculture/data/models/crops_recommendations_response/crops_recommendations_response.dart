import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'recommendation.dart';

part 'crops_recommendations_response.g.dart';

@JsonSerializable()
class CropsRecommendationsResponse {
  List<Recommendation>? recommendations;

  CropsRecommendationsResponse({this.recommendations});

  factory CropsRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return _$CropsRecommendationsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CropsRecommendationsResponseToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CropsRecommendationsResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => recommendations.hashCode;
}
