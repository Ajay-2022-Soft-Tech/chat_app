import 'package:chat_app/Controller/AuthController.dart';
import 'package:chat_app/Controller/ProfileController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
        actions: [
          IconButton(
              onPressed: (){
                Get.toNamed('/updateProfile');
              },
              icon: Icon(Icons.edit)
          )
        ],
      ),
    body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          LoginUserInfo(),
          Spacer(),
          ElevatedButton(
              onPressed: (){
                authController.logOutUser();
              },
              child: Text("Logout"))
        ],

      ),
    ),
    );
  }
}
