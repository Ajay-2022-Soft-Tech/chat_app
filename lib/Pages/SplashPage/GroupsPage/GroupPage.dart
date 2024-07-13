import 'package:chat_app/Config/Images.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/Widgets/ChatTile.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ChatTile(
            imageUrl: Assetsimage.boyPic,
            name: "Masti Group",
            lastChat: "Masti TIme",
            lastTime: "9:20 PM")
      ],
    );
  }
}
