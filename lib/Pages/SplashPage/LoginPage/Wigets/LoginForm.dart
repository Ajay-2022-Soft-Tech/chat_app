import 'package:chat_app/Controller/AuthController.dart';
import 'package:chat_app/Widget/PrimaryButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Config/Colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());

    return Column(
      children: [
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
              iconColor: Colors.lightBlueAccent[700],
                fillColor: Colors.grey[800],
                filled: true,
              hintText: 'Email',
              icon: Icon(Icons.email_outlined)
            ),
          ),

        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: password,
            decoration: InputDecoration(
                iconColor: Colors.lightBlueAccent[700],
                fillColor: Colors.grey[800],
                filled: true,
                hintText: 'Password',
                icon: Icon(Icons.lock)
            ),
          ),

        ),
        SizedBox(height: 20,),
        Obx(()=>authController.isLoading.value ? CircularProgressIndicator(
          color: Colors.lightBlueAccent,
          strokeWidth: 4,
        ):
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                onTap: (){
                  authController.login(email.text, password.text);
                  // Get.offAllNamed("/homePage");

                },
                btnName: 'LOGIN', icon: Icons.door_front_door_outlined),
          ],
        ))

      ],
    );
  }
}
