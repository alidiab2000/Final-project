import '../../../../core/di/service_locater.dart';
import '../../data/models/weather_api_model.dart';
import '../recommendation_cubit/recommendations_cubit.dart';
import '../../ui/crops/crops_screen.dart';
import '../../ui/home/home_view.dart';
import '../../ui/profile_view/profile_screen.dart';
import '../../ui/schedule/schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../auth/data/model/user_model.dart';
import '../../../auth/data/repo/user_repo.dart';
import '../weather_cubit/weather_cubit.dart';

class NaviagtionbarCubit extends Cubit<int> {
  NaviagtionbarCubit() : super(0) {
    weatherCubit = getIt<WeatherCubit>();
  }

  UserModel? user;
  WeatherModel? weather;
  late WeatherCubit weatherCubit;

  Future<void> loadUserData() async {
    user = await UserRepository().fetchUserDetails();

    // Load weather data
    await refreshWeatherData();

    emit(state); // Re-emit current state to trigger UI update
  }

  // Method to refresh weather data
  Future<void> refreshWeatherData() async {
    try {
      weather = await weatherCubit.getWeather();
      emit(state); // Re-emit current state to trigger UI update
    } catch (e) {
      // Handle weather loading error if needed
      debugPrint('Weather loading error: $e');
    }
  }

  // Getter to access weather data
  WeatherModel? get weatherData => weather;

  // Getter to access weather cubit for listening to weather state changes
  WeatherCubit get weatherCubitInstance => weatherCubit;

  // Method to get current weather state
  WeatherState get weatherState => weatherCubit.state;

  // Method to check if weather data is available
  bool get hasWeatherData => weather != null;

  List<Widget> get destinations => [
    HomeView(userName: user?.userName ?? "User", weatherData: weather),
    CropsScreen(),
    BlocProvider(
      create: (context) => getIt<RecommendationsCubit>(),
      child: ScheduleView(),
    ),
    ProfileView(
      userName: user?.userName ?? "User",
      userEmail: user?.email ?? "",
    ),
  ];
  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Iconsax.category), label: 'Crops'),
    BottomNavigationBarItem(
      icon: Icon(Iconsax.calendar_edit),
      label: 'Schedule',
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconsax.profile_circle),
      label: 'Profile',
    ),
  ];

  void setIndex(int index) {
    emit(index);
  }
}
