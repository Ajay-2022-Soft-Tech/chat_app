import 'package:flutter/material.dart';
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
              fontFamily: "AlegreyaSansSC",
              fontWeight: FontWeight.w800
          ),
        ),
        SizedBox(height: 30,),

        Text(WelcomePageString.descFriends,
          style: TextStyle(
              fontSize: 16,
              color: Colors.white60,
              fontFamily: "AlegreyaSansSC",
              fontWeight: FontWeight.w800
          ),
        ),


      ],
    );
  }
}