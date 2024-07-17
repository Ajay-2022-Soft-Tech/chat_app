import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
    return Container(
      padding: const EdgeInsets.all(20),
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
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: profileImage,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[400],
                      ),
                      child: Row(children: [
                        SvgPicture.asset(
                          Assetsimage.profileAudioCall,

                          width: 25,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Call",
                          style: TextStyle(
                            color: Colors.black,

                          ),
                        )
                      ]),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(15),
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
                        const SizedBox(width: 10),
                        const Text(
                          "Video",
                          style: TextStyle(
                            color: Colors.black,

                          ),
                        )
                      ]),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[400],
                      ),
                      child: Row(children: [
                        SvgPicture.asset(
                          Assetsimage.appIconSVG,
                          width: 25,
                        ),
                        const SizedBox(width: 10),
                        const Text(
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