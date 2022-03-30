import 'package:flutter/material.dart';
import 'package:tbr_task/pages/splash/splash_screen.dart';

///Custom route handler
class RouteGenerator {
  ///Basic route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute<Widget>(
          builder: (context) => const SplashScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<Widget>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("ERROR"),
            centerTitle: true,
          ),
          body: const Center(
            child: Text("PAGE NOT FOUND!"),
          ),
        );
      },
    );
  }
}