import 'package:chat_app/Config/PagePath.dart';
import 'package:chat_app/Config/Theme.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/HomePage.dart';
import 'package:chat_app/Pages/SplashPage/LoginPage/LoginPage.dart';
import 'package:chat_app/Pages/SplashPage/SplashPage/Splash_page.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/WelcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: SplashPage(),
    );
  }
}
