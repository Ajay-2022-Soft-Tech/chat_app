import 'package:flutter/material.dart';
import '../../../../Config/Strings.dart';

class Welcomebody extends StatelessWidget {
  const Welcomebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            // Image.asset(Assetsimage.boyPic,height: 10,),
            // Image.asset(Assetsimage.connectSVG,height: 100),
            // Image.asset(Assetsimage.girlPic,height: 100,),
          ],
        ),
        Text(WelcomePageString.nowYouAre,style: Theme.of(context).textTheme.headlineMedium,),
        const Text(textAlign: TextAlign.center, WelcomePageString.connected,style: TextStyle(color: Colors.lightBlue,fontSize: 30,fontWeight: FontWeight.w500),),
        const SizedBox(height: 20,),
        const Text(WelcomePageString.description,style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),),
      ],
    );
  }
}
