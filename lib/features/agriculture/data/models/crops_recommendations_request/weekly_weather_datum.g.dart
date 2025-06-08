// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_weather_datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyWeatherDatum _$WeeklyWeatherDatumFromJson(Map<String, dynamic> json) =>
    WeeklyWeatherDatum(
      date: json['date'] as String?,
      n: (json['N'] as num?)?.toDouble(),
      p: (json['P'] as num?)?.toDouble(),
      k: (json['K'] as num?)?.toDouble(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toInt(),
      ph: (json['ph'] as num?)?.toDouble(),
      rainfallMm: json['rainfall(mm)'] as bool?,
    );

Map<String, dynamic> _$WeeklyWeatherDatumToJson(WeeklyWeatherDatum instance) =>
    <String, dynamic>{
      'date': instance.date,
      'N': instance.n,
      'P': instance.p,
      'K': instance.k,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'ph': instance.ph,
      'rainfall(mm)': instance.rainfallMm,
    };
