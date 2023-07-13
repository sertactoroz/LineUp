import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lineup/colors/colors.dart';

import '../LoginPage/login_page_view.dart';

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
      backgroundColor: bgColor,
      showLoader: false,
      durationInSeconds: 4,
      navigator: const LoginPageView(),
    );
  }
}
