import 'package:chat_app/Config/Images.dart';
import 'package:chat_app/Pages/SplashPage/ChatPage/Widgets/ChatBubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),

        backgroundColor: Colors.black,
        title: const Row(
          children: [
            CircleAvatar(backgroundColor: Colors.lightBlueAccent,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ajay Ji",style: TextStyle(color: Colors.white),),
                Text("Online",style: TextStyle(color: Colors.white,fontSize: 12),)
              ],
            ),
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
            const Expanded(
                child: TextField(
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
            Container(
              height: 25,
                width: 25,

                child: SvgPicture.asset(Assetsimage.sendButtonSvg,width: 25)),

          ],
        ),
      ),



      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children:const [
            Column(
              children: [
                ChatBubble(message:'This is text SMS' ,isComing: true,status: 'Read',time: '12:56 PM',imageUrl: '',),
                ChatBubble(message:'Aaj Kahan Ghumne Jana h' ,isComing: false,status: 'Read',time: '12:56 PM',imageUrl: "https://images.app.goo.gl/NAu7hzFfJw8h91Zk6",),
                ChatBubble(message:'This is text SMS' ,isComing: true,status: 'Read',time: '12:56 PM',imageUrl: '',),
                ChatBubble(message:'Aaj Kahan Ghumne Jana h' ,isComing: true,status: 'Read',time: '12:56 PM',imageUrl: "assets/images/sample1.jpg",),
                ChatBubble(message:'This is text SMS' ,isComing: true,status: 'Read',time: '12:56 PM',imageUrl: '',),
                ChatBubble(message:'Aaj Kahan Ghumne Jana h' ,isComing: false ,status: 'Read',time: '12:56 PM',imageUrl: "https://images.app.goo.gl/NAu7hzFfJw8h91Zk6",),

              ],
            ),
          ]
        ),
      ),

    );
  }
}
