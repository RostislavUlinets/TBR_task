import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tbr_task/pages/splash/splash_screen.dart';
import 'package:tbr_task/routes/route_generator.dart';

///Start point of the program
class Launcher extends StatelessWidget {
  ///Const constructor
  const Launcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );

    return const MaterialApp(
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
