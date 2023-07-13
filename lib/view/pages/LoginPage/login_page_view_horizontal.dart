import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class LoginPageViewHorizontal extends StatefulWidget {
  const LoginPageViewHorizontal({super.key});

  @override
  State<LoginPageViewHorizontal> createState() =>
      _LoginPageViewHorizontalState();
}

class _LoginPageViewHorizontalState extends State<LoginPageViewHorizontal> {
  final formKey = GlobalKey<FormState>();

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth / 3,
                height: screenHeight / 3,
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
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
                    ),
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
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                width: 50,
                child: VerticalDivider(
                  color: mainColor,
                  thickness: 3,
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
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
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
