import 'package:chat_app/Config/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Config/Images.dart';
import '../../../../Controller/ChatController.dart';
import '../../../../Model/UserModel.dart';
import '../../../../Widget/ImagePickerBottomSheet.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;

  const TypeMessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    RxString message = "".obs;


    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[700],
      ),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              Assetsimage.chatEmoji,
              width: 25,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value){
                message.value = value;
              },
              controller: messageController,
              decoration: const InputDecoration(
                filled: false,
                hintText: 'Type message...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          SizedBox(width: 10),
          Obx(()=>

          chatController.selectedImagePath.value == ""?
          InkWell(
            onTap: ()async{
              ImagePickerBottomSheet(chatController, imagePickerController);
            },
            child: Container(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                Assetsimage.gallerySvg,
                color: Colors.white,
                width: 25,
              ),
            ),
          ):
              SizedBox()

          ),
          SizedBox(width: 10),

          Obx(()=> message.value != "" || chatController.selectedImagePath.value != ""
              ? InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              if (messageController.text.isNotEmpty || chatController.selectedImagePath.value.isNotEmpty) {
                chatController.sendMessage(
                    userModel.id!,
                    messageController.text,
                    userModel
                );
                messageController.clear();
                message.value == "";
              }
            },
            child: Container(
              height: 30,
              width: 30,
              child: chatController.isLoading.value ? CircularProgressIndicator():
              SvgPicture.asset(
                Assetsimage.sendButtonSvg,
                width: 25,
              ),
            ),
          ):


          Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              Assetsimage.chatMicSvg,
              color: Colors.white,
              width: 25,
            ),
          )



          )
        ],
      ),

    );
  }

}
