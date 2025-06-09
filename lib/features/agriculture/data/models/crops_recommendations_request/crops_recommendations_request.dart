import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'weekly_weather_datum.dart';
part 'crops_recommendations_request.g.dart';

@JsonSerializable()
class CropsRecommendationsRequest {
  String? crop;
  int? area;
  @JsonKey(name: 'weekly_weather_data')
  List<WeeklyWeatherDatum>? weeklyWeatherData;

  CropsRecommendationsRequest({this.crop, this.area, this.weeklyWeatherData});

  factory CropsRecommendationsRequest.fromJson(Map<String, dynamic> json) {
    return _$CropsRecommendationsRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CropsRecommendationsRequestToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CropsRecommendationsRequest) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      crop.hashCode ^ area.hashCode ^ weeklyWeatherData.hashCode;
}
