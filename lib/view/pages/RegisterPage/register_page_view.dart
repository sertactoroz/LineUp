import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController userNameController = TextEditingController();

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
                        ? RegisterPageViewVertical(
                            emailController: emailController,
                            userNameController: userNameController,
                            passwordController: passwordController,
                            registerFunction: () {
                              register(
                                emailController,
                                userNameController,
                                passwordController,
                              );
                            },
                          )
                        : RegisterPageViewHorizontal(
                            emailController: emailController,
                            userNameController: userNameController,
                            passwordController: passwordController,
                            registerFunction: () {
                              register(
                                emailController,
                                userNameController,
                                passwordController,
                              );
                            },
                          )),
              ),
            ),
          );
        },
      ),
    );
  }

  register(
    TextEditingController emailController,
    TextEditingController userNameController,
    TextEditingController passwordController,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
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
