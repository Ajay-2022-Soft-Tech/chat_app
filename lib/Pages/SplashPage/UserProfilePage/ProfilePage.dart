import 'package:chat_app/Config/Images.dart';
import 'package:chat_app/Controller/AuthController.dart';
import 'package:chat_app/Controller/ProfileController.dart';
import 'package:chat_app/Model/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

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
          LoginUserInfo(
            profileImage: userModel.profileImage ?? Assetsimage.defaultProfileUrl,
            userName: userModel.name ?? "User",
            userEmail: userModel.email ?? "",
          ),
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
