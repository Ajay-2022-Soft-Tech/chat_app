import 'package:chat_app/Pages/SplashPage/HomePage/Widgets/ChatTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            child: ChatTile(imageUrl: '',name: 'Ajay Kumar',lastChat: 'Baad me baat krte',lastTime: '12:09 PM',)),
        ChatTile(imageUrl: '',name: 'Dewangan',lastChat: 'Abhi me baat krte',lastTime: '11:02 AM',),
        ChatTile(imageUrl: '',name: 'Anjana',lastChat: 'Abhi me baat krte',lastTime: '11:02 AM',),
        ChatTile(imageUrl: '',name: 'Kumar',lastChat: 'Abhi me baat krte',lastTime: '11:02 AM',),
        ChatTile(imageUrl: '',name: 'Saurav',lastChat: 'Abhi me baat krte',lastTime: '11:02 AM',),
      ],
    );


  }
}
