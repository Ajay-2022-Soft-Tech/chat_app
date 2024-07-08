import 'package:chat_app/Config/Colors.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:chat_app/Config/Strings.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeBody.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeFooterButton.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeHeading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';


class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            SizedBox(height: 60,),
            //Chat Icon

            Welcomeheading(),
            SizedBox(height: 30,),
            Welcomebody(),
            SizedBox(height: 20,),
            Welcomefooterbutton()

          ],

        ),
      ),
    );
  }
}
