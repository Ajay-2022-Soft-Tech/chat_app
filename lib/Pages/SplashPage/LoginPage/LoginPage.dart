import 'package:chat_app/Pages/SplashPage/LoginPage/Wigets/LoginPageBody.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeHeading.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 90,),
            Welcomeheading(),
            SizedBox(height: 20,),
            LoginPageBody()

          ],
        ),
      ),
    );
  }
}
