import 'package:final_project/features/auth/logic/cubit/authcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/ui/forget_password/forget_pass_view.dart';
import 'router.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    // To pass args => args as (settings.arguments as YourType)
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Onboarding Page'))),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Login Page'))),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Register Page'))),
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
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Home Page'))),
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
