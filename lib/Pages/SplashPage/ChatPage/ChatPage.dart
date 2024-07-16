import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Controller/CallController.dart';
import '../../../Controller/ChatController.dart';
import '../../../Controller/ProfileController.dart';
import '../../../Model/UserModel.dart';
import '../CallPage/AudioCallPage.dart';
import '../CallPage/VideoCall.dart';
import '../UserProfilePage/ProfilePage.dart';
import 'Widgets/ChatBubble.dart';
import 'Widgets/TypeMessage.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    CallController callController = Get.put(CallController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl:
                userModel.profileImage ?? Assetsimage.boyPic,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userModel.name ?? "User",
                      style: Theme.of(context).textTheme.bodyLarge),
                  StreamBuilder(
                    stream: chatController.getStatus(userModel.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("........");
                      } else {
                        return Text(
                          snapshot.data!.status ?? "",
                          style: TextStyle(
                            fontSize: 12,
                            color: snapshot.data!.status == "Online"
                                ? Colors.green
                                : Colors.grey,
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(AudioCallPage(target: userModel));
              callController.callAction(
                  userModel, profileController.currentUser.value, "audio");
            },
            icon: Icon(
              Icons.phone,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(VideoCallPage(target: userModel));
              callController.callAction(
                  userModel, profileController.currentUser.value, "video");
            },
            icon: Icon(
              Icons.videocam,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 10, top: 0, left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  StreamBuilder(
                    stream: chatController.getMessages(userModel.id!),
                    builder: (context, snapshot) {
                      var roomid = chatController.getRoomId(userModel.id!);
                      chatController.markMessagesAsRead(roomid!);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
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
                      } else {
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            DateTime timestamp = DateTime.parse(
                                snapshot.data![index].timestamp!);
                            String formattedTime =
                            DateFormat('hh:mm a').format(timestamp);

                            return ChatBubble(
                              message: snapshot.data![index].message!,
                              imageUrl: snapshot.data![index].imageUrl ?? "",
                              isComming: snapshot.data![index].receiverId ==
                                  profileController.currentUser.value.id,
                              status: snapshot.data![index].readStatus!,
                              time: formattedTime,
                            );
                          },
                        );
                      }
                    },
                  ),
                  Obx(
                        () => (chatController.selectedImagePath.value != "")
                        ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                  File(chatController
                                      .selectedImagePath.value),
                                ),
                                fit: BoxFit.contain,
                              ),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 500,
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                chatController.selectedImagePath.value =
                                "";
                              },
                              icon: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                  )
                ],
              ),
            ),
            TypeMessage(
              userModel: userModel,
            ),
          ],
        ),
      ),
    );
  }
}