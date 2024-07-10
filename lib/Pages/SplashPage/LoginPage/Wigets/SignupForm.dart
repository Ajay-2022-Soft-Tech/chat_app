import 'package:chat_app/Widget/PrimaryButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Config/Colors.dart';
import '../../../../Controller/AuthController.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController name = TextEditingController();
    AuthController authController = Get.put(AuthController());

    return Column(
      children: [
        SizedBox(height: 40,),
        TextField(
          controller: name,
          decoration: InputDecoration(
              fillColor: Colors.grey[800],
              filled: true,
              hintText: 'Full Name',
              icon: Icon(Icons.person)
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
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
        ):Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                onTap: (){
                  authController.createUser(email.text, password.text,name.text);
                },
                btnName: 'SIGNUP', icon: Icons.door_front_door_outlined),
          ],
        ),)
      ],
    );
  }
}
