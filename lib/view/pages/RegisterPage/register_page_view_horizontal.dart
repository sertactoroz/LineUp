import 'package:flutter/material.dart';
import 'package:lineup/core/components/widgets/text_form_widget.dart';

import '../../../colors/colors.dart';
import '../LoginPage/login_page_view.dart';

class RegisterPageViewHorizontal extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Function registerFunction;
  RegisterPageViewHorizontal({
    super.key,
    required this.emailController,
    required this.userNameController,
    required this.passwordController,
    required this.registerFunction,
  });

  @override
  State<RegisterPageViewHorizontal> createState() =>
      _RegisterPageViewHorizontalState();
}

class _RegisterPageViewHorizontalState
    extends State<RegisterPageViewHorizontal> {
  final formKey = GlobalKey<FormState>();

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
                    TextFormWidget(
                      controller: widget.emailController,
                      hinText: "example@example.com",
                      labelText: "e-mail",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormWidget(
                      controller: widget.userNameController,
                      hinText: "username",
                      labelText: "username",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormWidget(
                      iconVisible: true,
                      isHided: isHided,
                      controller: widget.passwordController,
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
                    onPressed: () {
                      widget.registerFunction();
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPageView(),
                        ),
                      );
                    },
                    child: const Text('Login'),
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
