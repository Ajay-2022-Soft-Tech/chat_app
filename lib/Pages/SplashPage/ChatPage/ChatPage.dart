import 'package:chat_app/Config/Images.dart';
import 'package:chat_app/Controller/ChatController.dart';
import 'package:chat_app/Controller/ProfileController.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Pages/SplashPage/ChatPage/Widgets/ChatBubble.dart';
import 'package:chat_app/Pages/SplashPage/UserProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: (){
            Get.to(UserProfilePage(userModel: userModel,));
          },
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Image.asset(Assetsimage.boyPic,),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: (){
            Get.to(UserProfilePage(userModel: userModel,));
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[700],
        ),

        child: Row(
          children: [
            Container(
              width: 25,
            height: 25,
              child: SvgPicture.asset(
                Assetsimage.chatMicSvg,
                color: Colors.white,
                width: 25,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: 'Type message...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                Assetsimage.gallerySvg,
                color: Colors.white,
                width: 25,
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                if (messageController.text.isNotEmpty) {
                  chatController.sendMessage(
                    userModel.id!,
                    messageController.text,
                    userModel
                  );
                  messageController.clear();
                }
              },
              child: Container(
                height: 30,
                width: 30,
                child: SvgPicture.asset(
                  Assetsimage.sendButtonSvg,
                  width: 25,
                ),
              ),
            ),
          ],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80, top: 10, left: 10, right: 10),
        child: StreamBuilder<List<ChatModel>>(
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
      ),
    );
  }
}
