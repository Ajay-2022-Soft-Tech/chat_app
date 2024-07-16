import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {

  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  const ChatTile({super.key, required this.imageUrl, required this.name, required this.lastChat, required this.lastTime});

  @override
  Widget build(BuildContext context) {

      return Container(
        margin: const EdgeInsets.only(bottom: 0,right: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        width: 70,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      )
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(lastChat,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12
                    
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 15,)
                ],
              ),
            ),

            Text(lastTime,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12
              ),
            ),

          ],
        ),
      );

  }
}
