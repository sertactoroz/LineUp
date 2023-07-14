import 'package:flutter/material.dart';
import 'package:lineup/colors/colors.dart';
import 'package:lineup/view/pages/RegisterPage/register_page_view_horizontal.dart';
import 'package:lineup/view/pages/RegisterPage/register_page_view_vertical.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
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
                      ? const RegisterPageViewVertical()
                      : const RegisterPageViewHorizontal(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
