import 'package:chat_app/Config/Images.dart';
import 'package:chat_app/Controller/ChatController.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Pages/SplashPage/ChatPage/Widgets/ChatBubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Model/ChatModel.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {

    ChatController chatController = Get.put(ChatController());

    TextEditingController messageController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Image.asset(Assetsimage.boyPic),
        ),
        title:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userModel.name ??"User",style: TextStyle(color: Colors.white),),
                Text("Online",style: TextStyle(color: Colors.white,fontSize: 12),)
              ],
            ),

        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.call)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.videocam)
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all( 10),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[700]
        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
            SvgPicture.asset(Assetsimage.chatMicSvg,color: Colors.white,width: 25,),
            SizedBox(width: 10,),
             Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'Type message...',
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                )
            ),
            SvgPicture.asset(Assetsimage.gallerySvg,color: Colors.white,width: 25),
            SizedBox(width: 20,),
            InkWell(
              onTap: (){

                var newChat =  ChatModel(


                );
                if(messageController.text.isNotEmpty){
                  chatController.sendMessage(userModel.id!, messageController.text,);
                  messageController.clear();
                }
              },
              child: Container(
                height: 25,
                  width: 25,

                  child: SvgPicture.asset(Assetsimage.sendButtonSvg,width: 25)),
            ),

          ],
        ),
      ),



      body: Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<List<ChatModel>>(
          stream: chatController.getMessages(userModel.id!),
          builder: (context , snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());

            }
            if(snapshot.hasError){
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            if(snapshot.data ==null){
              return Center(
                child: Text("No Messages"),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                  // DateTime timestamp = DateTime.parse(snapshot.data![index].timestamp!);
                    
                    return ChatBubble(message: snapshot.data![index].message!, isComing: isComing, time: time, status: status, imageUrl: imageUrl)

                  }

              );
            }
          },
        )
      ),

    );
  }
}
