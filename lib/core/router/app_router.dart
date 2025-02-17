import 'package:flutter/material.dart';
import '../../features/onboarding/ui/onboarding_view.dart';
import 'router.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    // To pass args => args as (settings.arguments as YourType)
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Login Page'))),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Register Page'))),
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
