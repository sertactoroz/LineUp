import 'package:flutter/material.dart';
import 'package:lineup/core/components/widgets/text_form_widget.dart';
import 'package:lineup/view/pages/RegisterPage/register_page_view.dart';

import '../../../colors/colors.dart';

class LoginPageViewVertical extends StatefulWidget {
  const LoginPageViewVertical({super.key});

  @override
  State<LoginPageViewVertical> createState() => _LoginPageViewVerticalState();
}

class _LoginPageViewVerticalState extends State<LoginPageViewVertical> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isHided = false;

  setIsHided() {
    isHided = !isHided;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontSize = screenWidth * 0.04;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        const SizedBox(height: 20),
        TextFormWidget(
          controller: emailController,
          hinText: "example@example.com",
          labelText: "e-mail",
        ),
        const SizedBox(height: 10),
        TextFormWidget(
          iconVisible: true,
          isHided: isHided,
          controller: passwordController,
          iconButton: () {
            setIsHided();
          },
          hinText: "*****",
          labelText: "password",
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: screenHeight / 10,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Login",
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Divider(
          indent: 50,
          endIndent: 50,
          color: mainColor,
          thickness: 3,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPageView(),
              ),
            );
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}
