import 'package:chat_app/Widget/PrimaryButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Config/Colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextField(
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
            decoration: InputDecoration(
              border: InputBorder.none,
                iconColor: Colors.lightBlueAccent[700],
                fillColor: Colors.grey[800],
                filled: true,
                hintText: 'Password',
                icon: Icon(Icons.lock)
            ),
          ),

        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(btnName: 'LOGIN', icon: Icons.door_front_door_outlined),
          ],
        )
      ],
    );
  }
}
