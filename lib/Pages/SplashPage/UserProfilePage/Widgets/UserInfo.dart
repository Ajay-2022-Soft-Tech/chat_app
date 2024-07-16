import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Controller/ProfileController.dart';


class LoginUserInfo extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  const LoginUserInfo(
      {super.key,
        required this.profileImage,
        required this.userName,
        required this.userEmail});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Container(
      padding: EdgeInsets.all(20),
      // height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: profileImage,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userEmail,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[400],
                      ),
                      child: Row(children: [
                        SvgPicture.asset(
                          Assetsimage.profileAudioCall,

                          width: 25,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Call",
                          style: TextStyle(
                            color: Colors.black,

                          ),
                        )
                      ]),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[400],



                      ),
                      child: Row(children: [
                        SvgPicture.asset(
                          Assetsimage.profileVideoCall,
                          width: 25,

                          color: Colors.red,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Video",
                          style: TextStyle(
                            color: Colors.black,

                          ),
                        )
                      ]),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[400],
                      ),
                      child: Row(children: [
                        SvgPicture.asset(
                          Assetsimage.appIconSVG,
                          width: 25,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Chat",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ]),
                    )
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