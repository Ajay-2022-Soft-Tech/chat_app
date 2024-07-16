import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/ChatController.dart';
import '../../../../Controller/ContactController.dart';
import '../../../../Controller/ProfileController.dart';
import '../../../../Model/ChatRoomModel.dart';
import '../../ChatPage/ChatPage.dart';
import 'ChatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    return StreamBuilder<List<ChatRoomModel>>(
      stream: contactController.getChatRoom(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        List<ChatRoomModel>? e = snapshot.data;

        return ListView.builder(
          itemCount: e!.length,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                chatController.markMessagesAsRead(e[index].id!);
                Get.to(
                  ChatPage(
                    userModel: (e[index].receiver!.id ==
                        profileController.currentUser.value.id
                        ? e[index].sender
                        : e[index].receiver)!,
                  ),
                );
              },
              child: ChatTile(
                imageUrl: (e[index].receiver!.id ==
                    profileController.currentUser.value.id
                    ? e[index].sender!.profileImage
                    : e[index].receiver!.profileImage) ??
                    Assetsimage.defaultProfileUrl,
                name: (e[index].receiver!.id ==
                    profileController.currentUser.value.id
                    ? e[index].sender!.name
                    : e[index].receiver!.name)!,
                lastChat: e[index].lastMessage ?? "Last Message",
                lastTime: e[index].lastMessageTimestamp ?? "Last Time",
              ),
            );
          },
        );
      },
    );
  }
}