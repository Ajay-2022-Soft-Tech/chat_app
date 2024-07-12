import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../Config/ImagePicker.dart';
import '../Controller/ChatController.dart';

Future<dynamic> ImagePickerBottomSheet(ChatController chatController, ImagePickerController imagePickerController) {
  return Get.bottomSheet(
      Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: ()async{
                chatController.selectedImagePath.value = await imagePickerController.pickImage(ImageSource.camera);
                Get.back();

              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15)

                ),
                child: Icon(Icons.camera,size: 30,),
              ),
            ),
            InkWell(
              onTap: ()async{
                chatController.selectedImagePath.value = await imagePickerController.pickImage(ImageSource.gallery);
                Get.back();


              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15)

                ),
                child: Icon(Icons.photo,size: 30,),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15)

                ),
                child: Icon(Icons.videocam,size: 30,),
              ),
            ),
          ],
        ),
      )
  );
}
