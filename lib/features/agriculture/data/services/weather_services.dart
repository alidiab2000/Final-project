import 'dart:convert';

import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = '30e2ecc157a34dcabbe180123252105';
  Future<WeatherModel> getweather({required String cityname,int days=5}) async {
    Uri url = Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityname&days=$days');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromjson(data);
    return weather;
  }
}
