import 'package:chat_app/Controller/AppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Config/ImagePicker.dart';
import '../CallHistory/CallHistory.dart';
import '../GroupsPage/GroupPage.dart';
import '../ProfilePage/ProfilePage.dart';
import 'Widgets/ChatList.dart';
import 'Widgets/TabBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    AppController appController = Get.put(AppController());

    Get.put(ImagePickerController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "UniChat",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading:  Image.asset("assets/icons/app_icon.png"),
        actions: [
          IconButton(
            onPressed: () {
              appController.checkLatestVersion();
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () async {
              Get.to(const ProfilePage());
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          )
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: const [
            ChatList(),
            GroupPage(),
            CallHistory(),
          ],
        ),
      ),
    );
  }
}