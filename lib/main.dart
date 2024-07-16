import 'package:chat_app/Pages/SplashPage/Auth/AuthPage.dart';
import 'package:chat_app/Pages/SplashPage/LoginPage/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'Config/PagePath.dart';
import 'Config/Theme.dart';
import 'Pages/SplashPage/SplashPage/Splash_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      title: 'UniChat',
      theme: lightTheme,
      getPages: pagePath,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const LoginPage(),
      // home: DemoPage2(),
    );
  }
}