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

      },
      text: WelcomePageString.slideToStart,
      textStyle: (TextStyle(color: Colors.grey,fontSize: 18)),

      sliderRotate: true,
      submittedIcon: Icon(Icons.currency_yen_sharp),
      sliderButtonIcon: Icon(Icons.child_friendly),
      innerColor: Theme.of(context).colorScheme.primary,
      outerColor: Colors.grey[900],
    );
  }
}
