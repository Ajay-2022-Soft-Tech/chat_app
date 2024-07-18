import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Controller/ChatController.dart';
import '../../../Controller/ProfileController.dart';

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    return StreamBuilder(
        stream: chatController.getCalls(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var callData = snapshot.data![index];
                DateTime? timestamp;
                if (callData.timestamp != null) {
                  timestamp = DateTime.parse(callData.timestamp!);
                }
                String formattedTime = timestamp != null
                    ? DateFormat('hh:mm a').format(timestamp)
                    : 'Unknown time';

                String imageUrl = callData.callerUid ==
                    profileController.currentUser.value.id
                    ? (callData.receiverPic ?? Assetsimage.defaultProfileUrl)
                    : (callData.callerPic ?? Assetsimage.defaultProfileUrl);

                String name = callData.callerUid ==
                    profileController.currentUser.value.id
                    ? (callData.receiverName ?? 'Unknown')
                    : (callData.callerName ?? 'Unknown');

                return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )),
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    formattedTime,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: callData.type == "video"
                      ? IconButton(
                    icon: Icon(Icons.video_call),
                    onPressed: () {},
                  )
                      : IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {},
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Container(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
