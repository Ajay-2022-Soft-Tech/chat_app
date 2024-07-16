import 'package:chat_app/Pages/SplashPage/Auth/AuthPage.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/HomePage.dart';
import 'package:chat_app/Pages/SplashPage/LoginPage/LoginPage.dart';
import 'package:chat_app/Pages/SplashPage/UserProfilePage/UpdateProfile/UpdateProfile.dart';
import 'package:get/get.dart';

import '../Pages/SplashPage/ContactPage/ContactPage.dart';

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

  GetPage(
      name:"/homePage",
      page:()=> HomePage(),
      transition: Transition.rightToLeft
  ),

  GetPage(
      name:"/contactPage",
      page:()=> ContactPage(),
      transition: Transition.rightToLeft
  ),
  GetPage(
      name:"/updateProfilePage",
      page:()=> UserUpdateProfile(),
      transition: Transition.rightToLeft
  ),

];