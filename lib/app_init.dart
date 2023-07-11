import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:lineup/view/pages/login_page.dart';
import 'package:page_transition/page_transition.dart';

class AppInit extends StatefulWidget {
  const AppInit({super.key});

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSplashScreen.withScreenFunction(
            splash: "lib/assets/lineup_logo.png",
            backgroundColor: Colors.white,
            screenFunction: () async {
              // await player.dispose();
              return const LoginScreen();
            },
            curve: Curves.ease,
            splashIconSize: 60,
            duration: 2,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.rightToLeft,
          ),
        ],
      ),
    );
  }
}
