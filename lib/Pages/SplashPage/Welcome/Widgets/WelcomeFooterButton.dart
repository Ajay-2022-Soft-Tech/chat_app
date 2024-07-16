import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../../../Config/Strings.dart';

class Welcomefooterbutton extends StatelessWidget {
  const Welcomefooterbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: (){
        Get.offAllNamed("/authPage");
        return null;
      },
      text: WelcomePageString.slideToStart,
      borderRadius: 30,
      textStyle: (const TextStyle(color: Colors.lightBlue,fontSize: 18)),
      sliderRotate: true,
      submittedIcon: const Icon(Icons.currency_yen_sharp),
      sliderButtonIcon: const Icon(Icons.child_friendly),
      innerColor: Colors.lightBlue,
      outerColor: Colors.grey[900],
    );
  }
}
