import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Config/Images.dart';
import '../../../../Controller/ProfileController.dart';
class LoginUserInfo extends StatelessWidget {
  final String profileImage ;
  final String userName ;
  final String userEmail ;
  const LoginUserInfo({super.key, required this.profileImage, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)

        ),
        child:  Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                          height: 150 ,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),

                              child: CachedNetworkImage(
                                imageUrl: profileController.currentUser.value.profileImage!,
                                fit: BoxFit.cover,
                                width: 70,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              )
                          ),
                      )

                    ],

                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                         Text(userName,
                         style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 5,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Text(userEmail,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),)

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.phone,color: Colors.green,),
                            SizedBox(width: 10,),
                            Text('Call',style: TextStyle(color: Colors.green),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.videocam,color: Colors.lightBlueAccent),
                            SizedBox(width: 10,),
                            Text('Video',style: TextStyle(color: Colors.lightBlueAccent),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.chat,color: Colors.red),
                            SizedBox(width: 10,),
                            Text('Chat',style: TextStyle(color: Colors.red),)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}
