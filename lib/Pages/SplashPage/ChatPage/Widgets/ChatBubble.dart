import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatBubble extends StatelessWidget {

  final String message;
  final bool  isComing;
  final String time;
  final String status;
  final String imageUrl;

  const ChatBubble({super.key, required this.message, required this.isComing, required this.time, required this.status, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: isComing ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width/1.6,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: isComing ? const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)):
                BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.black
            ),
            child: imageUrl == "" ?
          Text(message,style: TextStyle(color: Colors.white)):
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                    Center(child: const CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
                message == "" ? Container() : SizedBox(height: 10),
                message == "" ? Container() : Text(message),
              ],
            )),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: isComing ? MainAxisAlignment.start: MainAxisAlignment.end,
            children: [
              isComing ? Text(time,style: TextStyle(color: Colors.grey[400],fontSize: 12),) : Row(
                children: [
                  Text(time,style: TextStyle(color: Colors.grey[400],fontSize: 12),),
                  SizedBox(width: 5,),
                  SvgPicture.asset(Assetsimage.chatStatusSvg,color: Colors.lightBlueAccent,width: 15,),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
