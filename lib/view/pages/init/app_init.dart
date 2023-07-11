import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class AppInit extends StatefulWidget {
  const AppInit({super.key});

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/logo.png"),
      logoWidth: 100,
      backgroundColor: Colors.white,
      showLoader: false,
      // navigator: LoginPage(),
    );
  }
}
