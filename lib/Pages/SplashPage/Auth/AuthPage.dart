import 'package:chat_app/Pages/SplashPage/Auth/Widgets/AuthHeading.dart';
import 'package:chat_app/Pages/SplashPage/Welcome/Widgets/WelcomeHeading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25,),
              const Center(child: Welcomeheading()),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: AuthHeading(),
              ),
              const SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Image(image: AssetImage('assets/icons/google.png',),
                      height: 35,
                    ),
                  ),
                  const SizedBox(width: 30,),
                  const Image(image: AssetImage('assets/icons/facebook.png',),
                    height: 35,
                  ),
                  const SizedBox(width: 30,),
                  const Image(image: AssetImage('assets/icons/apple.png',),
                    height: 35,
                  ),


                ],

              ),
              const SizedBox(height: 30,),
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
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          child:  Center(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: (){
                                  Get.offAllNamed("/loginPage");

                                },
                                child: Text('Sign up with email',
                                  style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                              ))
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
      ),

    );
  }
}
