import 'package:flutter/material.dart';

import 'app_init.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  // runApp(MultiProvider(
  //   providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
  //   child: const MyApp(),
  // )
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LineUp',
      themeMode: ThemeMode.dark,
      home: AppInit(),
    );
  }
}
