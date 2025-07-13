import 'package:dio/dio.dart';
import '../../features/agriculture/data/services/recommendation_services.dart';
import '../../features/agriculture/data/services/weather_services.dart';
import '../../features/agriculture/logic/weather_cubit/weather_cubit.dart';
import '../../features/auth/logic/cubit/authcubit.dart';
import '../../features/location/data/location_service.dart';
import '../../features/location/logic/location_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/agriculture/logic/recommendation_cubit/recommendations_cubit.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit());
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
  getIt.registerFactory<WeatherService>(() => WeatherService(getIt()));
  getIt.registerFactory<Dio>(() => createAndSetupDio());
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30);

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
