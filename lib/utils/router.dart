import 'package:flutter/material.dart';
import 'package:mofud/constants/routes.dart';
import 'package:mofud/screens/dish_screen.dart';
import 'package:mofud/screens/home_screen.dart';
import 'package:mofud/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.dishScreen:
        if (args is DishScreenArgs) {
          return MaterialPageRoute(
            builder: (_) => DishScreen(
              dish: args.dish,
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
