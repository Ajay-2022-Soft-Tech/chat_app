import 'package:chat_app/Pages/SplashPage/Auth/Widgets/AuthHeading.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeHeading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            const Center(child: Welcomeheading()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: AuthHeading(),
            ),
            SizedBox(height: 25,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image(image: AssetImage('assets/icons/google.png',),
                    height: 35,
                  ),
                ),
                SizedBox(width: 30,),
                Image(image: AssetImage('assets/icons/facebook.png',),
                  height: 35,
                ),
                SizedBox(width: 30,),
                Image(image: AssetImage('assets/icons/apple.png',),
                  height: 35,
                ),


              ],

            ),
            SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                const Center(child: Text('Or')),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  child: InkWell(
                    onTap: (){

                    },
                    splashColor: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                        ),
                        child: const Center(child: Text('Sign up with email',style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: 20),))
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.offAllNamed("/loginPage");

                  },
                  child: RichText(
                      text: const TextSpan(
                    children: [
                      TextSpan(text: 'Existing account? ',style: TextStyle(
                        color: Colors.white70
                      )),
                      TextSpan(text: ' Log in',style: TextStyle(
                        color: Colors.white,
                      )),
                    ]
                  )),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
