import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

myTabBar(TabController tabController, BuildContext context){

  return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: TabBar(
        unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        indicatorColor: Colors.lightBlueAccent,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4,
        dividerColor: Colors.black,
        splashBorderRadius: BorderRadius.circular(90),

        controller: tabController,
        tabs: [
          Tab(text: 'Chats',),
          Tab(text: 'Groups',),
          Tab(text: 'Calls',),

        ],
      )
  );
}