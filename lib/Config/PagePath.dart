import 'package:chat_app/Pages/SplashPage/Auth/AuthPage.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/HomePage.dart';
import 'package:chat_app/Pages/SplashPage/LoginPage/LoginPage.dart';
import 'package:chat_app/Pages/SplashPage/UserProfilePage/UpdateProfile/UpdateProfile.dart';
import 'package:get/get.dart';

import '../Pages/SplashPage/ContactPage/ContactPage.dart';

var pagePath =[

  GetPage(
      name:"/authPage",
      page:()=> const AuthPage(),
    transition: Transition.rightToLeft
  ),
  GetPage(
      name:"/loginPage",
      page:()=> const LoginPage(),
      transition: Transition.rightToLeft
  ),

  GetPage(
      name:"/homePage",
      page:()=> const HomePage(),
      transition: Transition.rightToLeft
  ),

  GetPage(
      name:"/contactPage",
      page:()=> const ContactPage(),
      transition: Transition.rightToLeft
  ),
  GetPage(
      name:"/updateProfilePage",
      page:()=> const UserUpdateProfile(),
      transition: Transition.rightToLeft
  ),

];