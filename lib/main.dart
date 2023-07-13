import 'package:flutter/material.dart';
import 'package:lineup/view/pages/Init/app_init.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'LineUp',
    themeMode: ThemeMode.dark,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppInit();
  }
}
