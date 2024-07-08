import 'package:chat_app/Config/PagePath.dart';
import 'package:chat_app/Config/Theme.dart';
import 'package:chat_app/Pages/SplashPage/Splash_page.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: lightTheme,
      getPages: pagePath,
      darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
      home: Welcomepage(),
    );
  }
}
