import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubble(
      {super.key,
        required this.message,
        required this.isComming,
        required this.time,
        required this.status,
        required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment:
        isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 1.3,
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: isComming
                    ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(10),
                )
                    : const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: imageUrl == ""
                  ? Text(message,style: const TextStyle(color: Colors.white),)
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(color: Colors.lightBlue,),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                  message == "" ? Container() : const SizedBox(height: 10),
                  message == "" ? Container() : Text(message),
                ],
              )),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment:
            isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isComming
                  ? Text(
                time,
                style: Theme.of(context).textTheme.labelMedium,
              )
                  : Row(
                children: [
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    Assetsimage.chatStatusSvg,
                    color: status == "read" ? Colors.blue : Colors.grey,
                    width: 20,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}