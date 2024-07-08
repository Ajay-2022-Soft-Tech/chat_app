import 'package:chat_app/Pages/SplashPage/Auth/AuthPage.dart';
import 'package:chat_app/Pages/SplashPage/LoginPage/LoginPage.dart';
import 'package:get/get.dart';

var pagePath =[

  GetPage(
      name:"/authPage",
      page:()=> AuthPage(),
    transition: Transition.rightToLeft
  ),
  GetPage(
      name:"/loginPage",
      page:()=> LoginPage(),
      transition: Transition.rightToLeft
  ),
];