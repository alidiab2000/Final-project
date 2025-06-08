import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weekly_weather_datum.g.dart';

@JsonSerializable()
class WeeklyWeatherDatum {
  String? date;
  @JsonKey(name: 'N')
  double? n;
  @JsonKey(name: 'P')
  double? p;
  @JsonKey(name: 'K')
  double? k;
  double? temperature;
  int? humidity;
  double? ph;
  @JsonKey(name: 'rainfall(mm)')
  bool? rainfallMm;

  WeeklyWeatherDatum({
    this.date,
    this.n,
    this.p,
    this.k,
    this.temperature,
    this.humidity,
    this.ph,
    this.rainfallMm,
  });

  factory WeeklyWeatherDatum.fromJson(Map<String, dynamic> json) {
    return _$WeeklyWeatherDatumFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeeklyWeatherDatumToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! WeeklyWeatherDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      date.hashCode ^
      n.hashCode ^
      p.hashCode ^
      k.hashCode ^
      temperature.hashCode ^
      humidity.hashCode ^
      ph.hashCode ^
      rainfallMm.hashCode;
}
