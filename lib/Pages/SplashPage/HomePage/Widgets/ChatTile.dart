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
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15)
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [


                Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      imageUrl,
                      width: 60,
                      fit: BoxFit.cover,
                    
                    ),
                  ),
                ),
                // CircleAvatar(
                //   backgroundColor: Colors.lightBlueAccent,
                //   radius: 20,
                // ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(lastChat,
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12

                      ),
                    )
                  ],
                ),
              ],
            ),

            Text(lastTime,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12

              ),
            )

          ],
        ),
      );

  }
}
