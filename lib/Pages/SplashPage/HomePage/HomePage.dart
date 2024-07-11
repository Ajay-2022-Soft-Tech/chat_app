import 'package:chat_app/Config/ImagePicker.dart';
import 'package:chat_app/Config/Strings.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/Widgets/ChatList.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/Widgets/ChatTile.dart';
import 'package:chat_app/Pages/SplashPage/HomePage/Widgets/TabBar.dart';
import 'package:chat_app/Pages/SplashPage/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Controller/ProfileController.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ImagePickerController imagePickerController = Get.put(ImagePickerController());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName,style: Theme.of(context).textTheme.headlineSmall,),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: (){
                // imagePickerController.pickImage();
              },
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: ()async{
                // Get.toNamed("/profilePage");
                await profileController.getUserDetails();
                Get.to(ProfilePage());
              },
              icon: Icon(Icons.more_vert)
          ),

        ],
        bottom:myTabBar(tabController,context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatList(),
            Text('Group'),
            Text('Calls'),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed("/contactPage");
        },
        child: Icon(
          Icons.messenger,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
