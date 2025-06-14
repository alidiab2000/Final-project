import 'package:bloc/bloc.dart';
import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';
import 'package:final_project/features/agriculture/data/services/weather_services.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this.weatherService,
  ) : super(WeatherInitial());
  final WeatherService weatherService;
  Future<void> getWeather({required String cityname}) async {
    emit(WeatherLoading());
    try {
      WeatherModel weather = await weatherService.getWeather(
        cityname: cityname,
      );
      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherFailed(e.toString()));
    }
  }
}
