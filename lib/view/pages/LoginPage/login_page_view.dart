import 'package:flutter/material.dart';
import 'package:lineup/colors/colors.dart';

import 'login_page_view_horizontal.dart';
import 'login_page_view_vertical.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isHided = false;

  setIsHided() {
    isHided = !isHided;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final bool isPortrait = orientation == Orientation.portrait;
          final double screenWidth = MediaQuery.of(context).size.width;
          final double screenHeight = MediaQuery.of(context).size.height;

          return Form(
            key: formKey,
            child: SizedBox(
              height: isPortrait ? screenHeight : null,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: isPortrait ? 0.9 : 0.8,
                  child: isPortrait
                      ? const LoginPageViewVertical()
                      : const LoginPageViewHorizontal(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
