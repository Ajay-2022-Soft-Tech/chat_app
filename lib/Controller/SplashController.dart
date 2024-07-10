import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  final auth = FirebaseAuth.instance;

  void onInit(){

    super.onInit();
    splashHandle();
  }


  void splashHandle()async{
    
    await Future.delayed(Duration(seconds: 2),
    );
    if(auth.currentUser==null){

      Get.offAllNamed('/authPage');
      print(auth.currentUser!.email);

    }
    else{
      Get.offAllNamed('/homePage');

    }
  }
}