import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/ContactController.dart';
import '../../../Controller/ProfileController.dart';
import '../ChatPage/ChatPage.dart';
import '../GroupsPage/NewGroup/NewGroup.dart';
import '../HomePage/Widgets/ChatTile.dart';
import 'Widgets/ContactSearch.dart';
import 'Widgets/NewContactTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text("Select contact"),
        actions: [
          Obx(
                () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon:
              isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(
                  () => isSearchEnable.value ? ContactSearch() : SizedBox(),
            ),
            SizedBox(height: 10),
            NewContactTile(
              btnName: "New contact",
              icon: Icons.person_add,

              ontap: () {},
            ),
            SizedBox(height: 10),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group_add,
              ontap: () {
                Get.to(NewGroup());
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Contacts on UniChat",style: TextStyle(color: Colors.grey,fontFamily: "AlegreyaSansSC"),),
              ],
            ),
            SizedBox(height: 10),
            Obx(
                  () => Column(
                children: contactController.userList
                    .map(
                      (e) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.to(ChatPage(userModel: e));
                    },
                    child: ChatTile(
                      imageUrl:
                      e.profileImage ?? Assetsimage.defaultProfileUrl,
                      name: e.name ?? "User",
                      lastChat: e.about ?? "Hey there",
                      lastTime: e.email ==
                          profileController.currentUser.value.email
                          ? "You"
                          : "",
                    ),
                  ),
                )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}