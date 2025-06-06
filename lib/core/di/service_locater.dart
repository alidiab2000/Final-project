import 'package:final_project/features/location/data/location_service.dart';
import 'package:final_project/features/location/logic/location_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<LocationCubit>(() => LocationCubit(getIt()));
  getIt.registerLazySingleton<LocationService>(() => LocationService());
}
