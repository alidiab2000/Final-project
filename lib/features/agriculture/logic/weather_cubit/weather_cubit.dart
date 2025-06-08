import 'package:bloc/bloc.dart';
import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';
import 'package:final_project/features/agriculture/data/services/weather_services.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> getWeather({required String cityname}) async {
    emit(WeatherLoading());
    try {
      WeatherModel weather = await WeatherService().getweather(cityname: cityname);
        debugPrint(weather.toString());

      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherFailed( e.toString()));
    }
  }
}
