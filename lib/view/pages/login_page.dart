import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LottieBuilder.network(
            "https://assets9.lottiefiles.com/packages/lf20_XpVCMJTSQt.json",
            width: 300,
            height: 300,
          ),
          // const LoginButton()
        ],
      ),
    );
  }
}
