import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeBody.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeFooterButton.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeHeading.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:  const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 60,),
            Welcomeheading(),
            SizedBox(height: 30,),
            Welcomebody(),
            SizedBox(height: 20,),
            Welcomefooterbutton(),
          ],

        ),
      ),
    );
  }
}
