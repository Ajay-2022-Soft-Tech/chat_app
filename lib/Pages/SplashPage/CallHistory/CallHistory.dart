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
                DateTime timestamp = DateTime.parse(snapshot.data![index].timestamp!);
                String formattedTime = DateFormat('hh:mm a').format(timestamp);

                return Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ListTile(
                      tileColor: Color(0XFF292F3F),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data![index].callerUid ==
                              profileController.currentUser.value.id
                              ? snapshot.data![index].receiverPic == null
                              ? Assetsimage.defaultProfileUrl
                              : snapshot.data![index].receiverPic!
                              : snapshot.data![index].callerPic == null
                              ? Assetsimage.defaultProfileUrl
                              : snapshot.data![index].callerPic!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      title: Text(
                        snapshot.data![index].callerUid ==
                            profileController.currentUser.value.id
                            ? snapshot.data![index].receiverName!
                            : snapshot.data![index].callerName!,
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedTime, style: TextStyle(color: Colors.grey[600], fontSize: 13),
                          ),
                          SizedBox(height: 4),
                          // Text(
                          //   'Duration: ${snapshot.data![index].duration ?? "N/A"} mins',
                          //   style: TextStyle(color: Colors.grey[600], fontSize: 13),
                          // ),
                        ],
                      ),
                      trailing: snapshot.data![index].type == "video"
                          ? IconButton(
                        icon: Icon(Icons.video_call, color: Colors.blueAccent),
                        onPressed: () {},
                      )
                          : IconButton(
                        icon: Icon(Icons.call, color: Colors.greenAccent),
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Container(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
