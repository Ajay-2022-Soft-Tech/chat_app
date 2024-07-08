import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Config/Images.dart';
import '../../../../Config/Strings.dart';

class Welcomeheading extends StatelessWidget {
  const Welcomeheading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Center(child: SvgPicture.asset(
          Assetsimage.chatIconSVG,
          height: 80,
        )),

        SizedBox(height: 30,),
        Text(AppStrings.appName,style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary
        ),),

      ],
    );
  }
}
