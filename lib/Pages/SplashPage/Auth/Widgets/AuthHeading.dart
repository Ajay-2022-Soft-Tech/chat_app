import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Config/Images.dart';
import '../../../../Config/Strings.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        SizedBox(height: 30,),
        Text(WelcomePageString.connectFriends,
         style: TextStyle(
           fontSize: 68,
           color: Colors.white70,
           fontFamily: "Poppins",
           fontWeight: FontWeight.w800
         ),
        ),
        SizedBox(height: 30,),

        Text(WelcomePageString.descFriends,
         style: TextStyle(
           fontSize: 16,
           color: Colors.white12,
           fontFamily: "Poppins",
           fontWeight: FontWeight.w800
         ),
        ),


      ],
    );
  }
}
