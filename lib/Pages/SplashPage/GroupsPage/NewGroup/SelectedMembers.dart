import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/GroupController.dart';

class SelectedMembers extends StatelessWidget {
  const SelectedMembers({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Obx(
          () => Row(
          children: groupController.groupMembers
              .map(
                (e) => Stack(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl:
                        e.profileImage ?? Assetsimage.defaultProfileUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                    )),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      groupController.groupMembers.remove(e);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
              .toList()),
    );
  }
}