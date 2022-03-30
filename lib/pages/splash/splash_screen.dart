import 'package:flutter/material.dart';
import 'package:tbr_task/pages/authorization/auth_screen.dart';
import 'package:tbr_task/resources/app_images.dart';

///Spash Screen
class SplashScreen extends StatelessWidget {
  ///Route name
  static const String routeName = '/splash';

  ///Const constructor
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, AuthScreen.routeName);
      },
    );

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          image: AppImages.logo,
        ),
      ),
    );
  }
}
