import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lineup/core/components/widgets/text_form_widget.dart';

import '../../../colors/colors.dart';
import '../LoginPage/login_page_view.dart';

class RegisterPageViewVertical extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Function registerFunction;
  RegisterPageViewVertical({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.userNameController,
    required this.registerFunction,
  });

  @override
  State<RegisterPageViewVertical> createState() =>
      _RegisterPageViewVerticalState();
}

class _RegisterPageViewVerticalState extends State<RegisterPageViewVertical> {
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
          controller: widget.emailController,
          hinText: "example@example.com",
          labelText: "e-mail",
        ),
        const SizedBox(height: 10),
        TextFormWidget(
          controller: widget.userNameController,
          hinText: "username",
          labelText: "username",
        ),
        const SizedBox(height: 10),
        TextFormWidget(
          iconVisible: true,
          isHided: isHided,
          controller: widget.passwordController,
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
            onPressed: () {
              widget.registerFunction();
            },
            child: Text(
              "Register",
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
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginPageView(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // Left-to-right page transition
                  const begin =
                      Offset(-1.0, 0.0); // Start position of the new page
                  const end = Offset.zero; // End position of the new page
                  const curve = Curves.ease; // Animation curve
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.emailController.text,
        password: widget.passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
