import 'package:chat_app/Config/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Config/ImagePicker.dart';
import '../../../Controller/GroupController.dart';
import '../../../Model/GroupModel.dart';
import '../../../Widget/ImagePickerBottomSheet.dart';

class GroupTypeMessage extends StatelessWidget {
  final GroupModel groupModel;
  const GroupTypeMessage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
    Get.put(ImagePickerController());
    GroupController groupController = Get.put(GroupController());
    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[800]),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              Assetsimage.chatEmoji,
              color: Colors.white,

              width: 25,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                message.value = value;
              },
              controller: messageController,
              decoration: const InputDecoration(
                  filled: false, hintText: "Type message ..."),
            ),
          ),
          SizedBox(width: 10),
          Obx(
                () => groupController.selectedImagePath.value == ""
                ? InkWell(
              onTap: () {
                ImagePickerBottomSheet(
                    context,
                    groupController.selectedImagePath,
                    imagePickerController);
              },
              child: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  Assetsimage.gallerySvg,
                  color: Colors.white,
                  width: 25,
                ),
              ),
            )
                : SizedBox(),
          ),
          SizedBox(width: 10),
          Obx(
                () => message.value != "" ||
                groupController.selectedImagePath.value != ""
                ? InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                groupController.sendGroupMessage(
                  messageController.text,
                  groupModel.id!,
                  "",
                );
                messageController.clear();
                message.value = "";
              },
              child: Container(
                width: 30,
                height: 30,
                child: groupController.isLoading.value
                    ? CircularProgressIndicator()
                    : SvgPicture.asset(
                  Assetsimage.sendButtonSvg,
                  color: Colors.lightBlue,
                  width: 25,
                ),
              ),
            )
                : Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                Assetsimage.chatMicSvg,
                color: Colors.lightBlue,
                width: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}