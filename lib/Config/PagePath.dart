import 'package:chat_app/Pages/SplashPage/Auth/AuthPage.dart';
import 'package:chat_app/Pages/SplashPage/ChatPage/ChatPage.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/HomePage.dart';
import 'package:chat_app/Pages/SplashPage/LoginPage/LoginPage.dart';
import 'package:chat_app/Pages/SplashPage/UserProfilePage/ProfilePage.dart';
import 'package:chat_app/Pages/SplashPage/UserProfilePage/UpdateProfile/UpdateProfile.dart';
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

  GetPage(
      name:"/homePage",
      page:()=> Homepage(),
      transition: Transition.rightToLeft
  ),
  GetPage(
      name:"/chatPage",
      page:()=> ChatPage(),
      transition: Transition.rightToLeft
  ),
  // GetPage(
  //     name:"/profilePage",
  //     page:()=> UserProfilePage(),
  //     transition: Transition.rightToLeft
  // ),
  // GetPage(
  //     name:"/updateProfile",
  //     page:()=> UserUpdateProfile(),
  //     transition: Transition.rightToLeft
  // ),
];