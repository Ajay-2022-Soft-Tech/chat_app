import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Controller/ChatController.dart';

class ChatTile extends StatelessWidget {

  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  const ChatTile({super.key, required this.imageUrl, required this.name, required this.lastChat, required this.lastTime});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15)
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        width: 70,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                    ),
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.lightBlueAccent,
                  //   radius: 20,
                  // ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(lastChat,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12
                    
                          ),
                        )
                      ],
                    ),

                  ),
                  SizedBox(width: 15,)
                ],
              ),
            ),

            Text(lastTime,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12

              ),
            )

          ],
        ),
      );

  }
}
