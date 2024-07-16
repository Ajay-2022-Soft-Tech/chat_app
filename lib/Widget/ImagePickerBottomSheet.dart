import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Config/ImagePicker.dart';


Future<dynamic> ImagePickerBottomSheet(BuildContext context, RxString imagePath, ImagePickerController imagePickerController) {

  return Get.bottomSheet(
      Container(
    height: 150,
    decoration: const BoxDecoration(
      color: Color(0XFF292F3F),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () async {
            imagePath.value =
            await imagePickerController.pickImage(ImageSource.camera);
            Get.back();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.camera,
              size: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            imagePath.value =
            await imagePickerController.pickImage(ImageSource.gallery);
            Get.back();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.photo,
              size: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.play_arrow,
              size: 30,
            ),
          ),
        )
      ],
    ),
  ));
}
