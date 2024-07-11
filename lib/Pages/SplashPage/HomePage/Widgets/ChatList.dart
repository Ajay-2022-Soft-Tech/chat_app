import 'package:chat_app/Pages/SplashPage/HomePage/Widgets/ChatTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Config/Images.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, e});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: (){
            Get.offAllNamed("/chatPage");
          },
            child: ChatTile(imageUrl: Assetsimage.defaultProfileUrl,name: 'Ajay Kumar',lastChat: 'Baad me baat krte',lastTime: '12:09 PM',)),
        ChatTile(imageUrl: Assetsimage.defaultProfileUrl,name: 'Dewangan',lastChat: 'Abhi me baat krte',lastTime: '11:02 AM',),
        ChatTile(imageUrl: Assetsimage.defaultProfileUrl,name: 'Anjana',lastChat: 'Abhi me baat krte',lastTime: '11:02 AM',),
        ChatTile(imageUrl: Assetsimage.defaultProfileUrl,name: 'Kumar',lastChat: 'Abhi me baat krte',lastTime: '11:02 AM',),
        ChatTile(imageUrl: Assetsimage.defaultProfileUrl,name: 'Saurav',lastChat: 'Abhi me baat krte',lastTime: '11:02 AM',),
      ],
    );


  }
}
