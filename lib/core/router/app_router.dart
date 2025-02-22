// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project/features/auth/logic/cubit/authcubit.dart';
import 'package:final_project/features/auth/ui/register/register_screen.dart';
import 'package:final_project/features/home/ui/home_view.dart';
import 'package:final_project/features/onboarding/ui/onboarding_view.dart';

import '../../features/auth/ui/forget_password/forget_pass_view.dart';
import '../../features/auth/ui/login/login_screen.dart';
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
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.verifyEmail:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Verify Email'))),
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
