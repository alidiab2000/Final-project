import '../di/service_locater.dart';
import '../../features/agriculture/logic/recommendation_cubit/recommendations_cubit.dart';
import '../../features/agriculture/ui/crops/crop_info_screen.dart';
import '../../features/agriculture/logic/weather_cubit/weather_cubit.dart';
import '../../features/agriculture/ui/recommendation_screen/recommendation_screen.dart';
import '../../features/agriculture/ui/resuelt/resuelt_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/logic/cubit/authcubit.dart';
import '../../features/auth/ui/register/register_view.dart';
import '../../features/auth/ui/verify/verify_view.dart';
import '../../features/agriculture/ui/navigationbar/navigationbar_menu_view.dart';
import '../../features/auth/ui/onboarding/ui/onboarding_view.dart';
import '../../features/agriculture/data/models/crops_recommendations_response/crops_recommendations_response.dart';
import '../../features/agriculture/data/models/weather_api_model.dart';
import '../../features/agriculture/logic/navigationbar_cubit/naviagtionbar_cubit.dart';
import '../../features/agriculture/ui/weather/weather_view.dart';
import '../../features/auth/ui/forget_password/forget_pass_view.dart';
import '../../features/auth/ui/login/login_screen.dart';
import '../../features/location/logic/location_cubit.dart';
import '../../features/location/ui/location_view.dart';
import 'router.dart';

class AppRouter {
  final String initialRoute;
  AppRouter({required this.initialRoute});
  Route onGenerateRoute(RouteSettings settings) {
    // To pass args => args as (settings.arguments as YourType)
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AuthCubit(),
                child: LoginScreen(),
              ),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AuthCubit(),
                child: RegisterScreen(),
              ),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AuthCubit(),
                child: ForgetPasswordView(),
              ),
        );

      case Routes.verifyEmail:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AuthCubit(),
                child: VerificationEmailScreen(),
              ),
        );
      case Routes.navigationBarMenu:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => NaviagtionbarCubit()),
                  BlocProvider(create: (context) => getIt<WeatherCubit>()),
                ],
                child: NavigationBarMenuView(),
              ),
        );
      case Routes.cropInfo:
        return MaterialPageRoute(
          builder:
              (_) => CropInfoScreen(cropInfo: args as Map<String, dynamic>),
        );

      case Routes.weatherView:
        return MaterialPageRoute(
          builder: (_) => WeatherView(weatherData: args as WeatherModel?),
        );

      case Routes.location:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LocationCubit>(),
                child: LocationView(),
              ),
        );
      case Routes.recommendationScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<RecommendationsCubit>(),
                child: RecommendationScreen(weatherModel: args as WeatherModel),
              ),
        );
      case Routes.resultView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<RecommendationsCubit>(),
                child: ResueltView(
                  result: args as CropsRecommendationsResponse,
                ),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
