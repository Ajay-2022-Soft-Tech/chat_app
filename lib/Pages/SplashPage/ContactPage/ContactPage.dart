import 'package:chat_app/Config/Images.dart';
import 'package:chat_app/Controller/ChatController.dart';
import 'package:chat_app/Controller/ContactController.dart';
import 'package:chat_app/Controller/ProfileController.dart';
import 'package:chat_app/Pages/SplashPage/ChatPage/ChatPage.dart';
import 'package:chat_app/Pages/SplashPage/ContactPage/Widgets/ContactSearch.dart';
import 'package:chat_app/Pages/SplashPage/ContactPage/Widgets/NewContactTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HomePage/Widgets/ChatTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {

    RxBool isSearchEnable = false.obs;

    ContactController contactController = Get.put(ContactController());
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
        backgroundColor: Colors.black,
        actions: [
          Obx(()=>
              IconButton(
                  onPressed: (){
                    isSearchEnable.value = ! isSearchEnable.value;
                  },
                  icon: isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search)
              )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(

          children:[
            Obx(()=>
            isSearchEnable.value ?ContactSearch(): SizedBox(),

            ),

            const SizedBox(height:10,),
            NewContactTile(btnName: "New Contact",icon: Icons.person_add,ontap: (){},),
            const SizedBox(height:10,),
            NewContactTile(btnName: "New Group",icon: Icons.group_add,ontap: (){},),
            const SizedBox(height:10,),
            Row(
              children: [
                Text("Contacts on Chat App",style: TextStyle(color: Colors.grey[500]),),
              ],
            ),
            SizedBox(height:10,),

            Obx(()=>
                Column(
                    children: contactController.userList.map((e)=>
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: (){
                            Get.to(ChatPage(userModel: e,));
                          },
                          child:ChatTile(
                            imageUrl: e.profileImage ?? Assetsimage.defaultProfileUrl,
                            name: e.name ?? "User",
                            lastChat: e.about ??"Hey There",

                            lastTime: e.email== profileController.currentUser.value.email ? "You": "",
                          ),

                        ),

                    ).toList()

                )

            ),

    ]),

      ),
    );
  }
}
