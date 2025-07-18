import 'package:dio/dio.dart';
import '../models/weather_api_model.dart';


class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '30e2ecc157a34dcabbe180123252105';

  WeatherService(this.dio);

  Future<WeatherModel> getWeather({
    required double latitude,
    required double longitude,
    int days = 5,
  }) async {
    try {
      
      final response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': '$latitude,$longitude',
          'days': days,
        },
      );

      final data = response.data;
      final weather = WeatherModel.fromjson(data);
      return weather;
    } catch (e) {
      // Handle errors more gracefully in production
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
