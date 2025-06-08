import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommendation.g.dart';

@JsonSerializable()
class Recommendation {
  int? area;
  String? date;
  double? temperature;
  @JsonKey(name: 'total_water_usage')
  String? totalWaterUsage;
  @JsonKey(name: 'water_usage_per_sqm')
  String? waterUsagePerSqm;

  Recommendation({
    this.area,
    this.date,
    this.temperature,
    this.totalWaterUsage,
    this.waterUsagePerSqm,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return _$RecommendationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecommendationToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Recommendation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      area.hashCode ^
      date.hashCode ^
      temperature.hashCode ^
      totalWaterUsage.hashCode ^
      waterUsagePerSqm.hashCode;
}
