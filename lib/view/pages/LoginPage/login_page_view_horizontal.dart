import 'package:flutter/material.dart';
import 'package:lineup/core/components/widgets/text_form_widget.dart';

import '../../../colors/colors.dart';
import '../RegisterPage/register_page_view.dart';

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
    setState(() {
      isHided = !isHided;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontSize = screenWidth * 0.04;
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth / 5,
                  height: screenHeight / 5,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
              ],
            ),
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
                      child: TextFormWidget(
                        controller: emailController,
                        hinText: "example@example.com",
                        labelText: "e-mail",
                      ),
                    ),
                    TextFormWidget(
                      iconVisible: true,
                      isHided: isHided,
                      controller: passwordController,
                      iconButton: () {
                        setIsHided();
                      },
                      hinText: "******",
                      labelText: "password",
                    )
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
