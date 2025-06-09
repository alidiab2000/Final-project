import 'package:dio/dio.dart';
import 'package:final_project/features/agriculture/data/services/recommendation_services.dart';
import 'package:final_project/features/agriculture/data/services/weather_services.dart';
import 'package:final_project/features/agriculture/logic/weather_cubit/weather_cubit.dart';
import 'package:final_project/features/location/data/location_service.dart';
import 'package:final_project/features/location/logic/location_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/agriculture/logic/recommendation_cubit/recommendations_cubit.dart';

final getIt = GetIt.instance;
void initGetIt() {
  // Location
  getIt.registerFactory<LocationCubit>(() => LocationCubit(getIt()));
  getIt.registerLazySingleton<LocationService>(() => LocationService());

  // Recommendations
  getIt.registerFactory<RecommendationsCubit>(
    () => RecommendationsCubit(getIt()),
  );
  getIt.registerLazySingleton<RecommendationServices>(
    () => RecommendationServices(getIt()),
  );

  // Weather
  getIt.registerFactory<WeatherCubit>(() => WeatherCubit(getIt()));
  getIt.registerLazySingleton<WeatherService>(() => WeatherService(getIt()));
  getIt.registerLazySingleton<Dio>(() => createAndSetupDio());
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      responseHeader: false,
      requestHeader: false,
      request: true,
    ),
  );
  return dio;
}
