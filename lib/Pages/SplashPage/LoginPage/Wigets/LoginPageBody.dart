import 'package:chat_app/Pages/SplashPage/LoginPage/Wigets/LoginForm.dart';
import 'package:chat_app/Pages/SplashPage/LoginPage/Wigets/SignupForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {

    RxBool isLogin = true.obs;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        // height: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          boxShadow: List.filled(20, BoxShadow(color: Colors.black,blurRadius: 3,spreadRadius: 3,blurStyle: BlurStyle.outer))
        ),
        child:Obx(
              () =>  Row(
            children: [
              Expanded(child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          isLogin.value = true;

                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width/2.7,
                          child: Column(
                            children: [
                              Text('Login',style: isLogin.value ? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.labelLarge ,),
                              SizedBox(height: 5,),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),

                                width: isLogin.value ? 100 : 0,
                                height: 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.lightBlue,
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          isLogin.value = false;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width/2.7,
                          child: Column(
                            children: [
                              Text('Sign Up',style: isLogin.value ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.bodyLarge,),
                              SizedBox(height: 5,),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: isLogin.value ? 0 : 100,
                                height: 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.lightBlue,
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(()=> isLogin.value ? LoginForm():SignupForm())
                ],
              )),
            ],
          ),

        ),
      ),
    );

  }
}