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
    Get.put(ImagePickerController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "UniChat",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Icon(Icons.chat),
        actions: [
          IconButton(
            onPressed: () {
              // appController.checkLatestVersion();
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () async {
              Get.to(ProfilePage());
            },
            icon: Icon(
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