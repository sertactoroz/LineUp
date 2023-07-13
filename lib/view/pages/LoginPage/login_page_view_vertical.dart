import 'package:flutter/material.dart';

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
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: "example@gmail.com",
            labelText: "e-mail",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: isHided,
          controller: passwordController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  setIsHided();
                });
              },
              icon: isHided
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.remove_red_eye_outlined),
            ),
            hintText: "* * * * * *",
            labelText: "password",
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
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
        TextButton(onPressed: () {}, child: const Text('Register'))
      ],
    );
  }
}
