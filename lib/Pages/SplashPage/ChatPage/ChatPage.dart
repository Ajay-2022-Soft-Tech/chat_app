import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:chat_app/Controller/ChatController.dart';
import 'package:chat_app/Controller/ProfileController.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Pages/SplashPage/ChatPage/Widgets/ChatBubble.dart';
import 'package:chat_app/Pages/SplashPage/ChatPage/Widgets/TypeMessage.dart';
import 'package:chat_app/Pages/SplashPage/UserProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: (){
            // Get.to(UserProfilePage(userModel: userModel,));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: userModel.profileImage ?? Assetsimage.defaultProfileUrl!,
                    fit: BoxFit.cover,
                    width: 70,
                    placeholder: (context, url) =>
                        CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                )

            ),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: (){
            Get.to(ProfilePage(userModel: userModel,));
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name ?? "User",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Online",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
        ],
      ),
      body: Padding(

        padding: const EdgeInsets.only(bottom: 0, top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children :[
                  StreamBuilder<List<ChatModel>>(
                    stream: chatController.getMessages(userModel.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator()
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }
                      if (snapshot.data == null) {
                        return const Center(
                          child: Text("No Messages"),
                        );
                      }
                      else {
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            DateTime timestamps = DateTime.parse(snapshot.data![index].timestamp!);
                            String formattedTime = DateFormat("hh:mm a").format(timestamps);
                            return ChatBubble(
                              message: snapshot.data![index].message!,
                              isComing: snapshot.data![index].receiverId == profileController.currentUser.value.id,
                              time: formattedTime,
                              status: "Read",
                              imageUrl: snapshot.data![index].imageUrl ?? "",
                            );
                          },
                        );
                      }
                    },
                  ),
                 Obx(()=>
                     (chatController.selectedImagePath.value != "")?
                        Positioned(
                        bottom: 0,
                        left: 10,
                        right: 10,
                        child: Stack(
                          children: [


                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(
                                              chatController.selectedImagePath.value
                                          )
                                      )
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),

                              height: 400,
                            ),
                            Positioned(
                              right: 0,
                                child: IconButton(
                              onPressed: (){
                                chatController.selectedImagePath.value ="";
                              },
                              icon: Icon(Icons.close),
                            )),
                          ],
                        ))
                         : Container(),
                 )


                ]
              ),
            ),
            TypeMessage(userModel: userModel,),

          ],
        ),
      ),
    );
  }
}
