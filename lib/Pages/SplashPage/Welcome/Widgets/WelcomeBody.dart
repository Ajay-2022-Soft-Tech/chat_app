import 'package:flutter/material.dart';

import '../../../../Config/Strings.dart';

class Welcomebody extends StatelessWidget {
  const Welcomebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Image.asset(Assetsimage.boyPic,height: 10,),
            // Image.asset(Assetsimage.connectSVG,height: 100),
            // Image.asset(Assetsimage.girlPic,height: 100,),
          ],
        ),
        Text(WelcomePageString.nowYouAre,style: Theme.of(context).textTheme.headlineMedium,),
        Text(
          textAlign: TextAlign.center,
          WelcomePageString.connected,style: Theme.of(context).textTheme.headlineLarge,),
        SizedBox(height: 20,),
        Text(WelcomePageString.description,style: Theme.of(context).textTheme.labelLarge,),
      ],
    );
  }
}
