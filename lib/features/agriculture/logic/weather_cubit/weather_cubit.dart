import 'package:bloc/bloc.dart';
import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';
import 'package:final_project/features/agriculture/data/services/weather_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  final WeatherService weatherService;

  Future<WeatherModel> getWeather() async {
    emit(WeatherLoading());
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final double? latitude = sharedPreferences.getDouble('latitude');
      final double? longitude = sharedPreferences.getDouble('longitude');
      WeatherModel weather = await weatherService.getWeather(
        latitude: latitude ?? 0.0,
        longitude: longitude ?? 0.0,
      );
      emit(WeatherSuccess(weather));
      return weather;
    } catch (e) {
      emit(WeatherFailed(e.toString()));
      debugPrint(e.toString());
    }
    return WeatherModel.empty();
  }
}
