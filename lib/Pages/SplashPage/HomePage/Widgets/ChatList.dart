import 'package:chat_app/Controller/ChatController.dart';
import 'package:chat_app/Controller/ContactController.dart';
import 'package:chat_app/Pages/SplashPage/ChatPage/ChatPage.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/Widgets/ChatTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Config/Images.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, e});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    return RefreshIndicator(


    child: Obx(()=>
        ListView(
            children: contactController.chatRoomList.map((e)=>
                InkWell(
                  onTap: (){
                    Get.to(ChatPage(userModel: e.receiver!));
                  },
                  child: ChatTile(
                    imageUrl: e.receiver!.profileImage ?? Assetsimage.defaultProfileUrl,
                    name: e.receiver!.name ?? "User",
                    lastChat: e.lastMessage ?? "Last Message",
                    lastTime: e.lastMessageTimestamp ?? "Last Time",
                  ),
                )

            ).toList()
        )
    ),

        onRefresh: () {
      return contactController.getChatRoomList();
    }
    );


  }
}
