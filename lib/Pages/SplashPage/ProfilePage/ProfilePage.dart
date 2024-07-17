import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Config/ImagePicker.dart';
import '../../../Controller/AuthController.dart';
import '../../../Controller/ProfileController.dart';
import '../../../Widget/PrimaryButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    ProfileController profileController = Get.put(ProfileController());
    TextEditingController name =
    TextEditingController(text: profileController.currentUser.value.name);
    TextEditingController email =
    TextEditingController(text: profileController.currentUser.value.email);
    TextEditingController phone = TextEditingController(
        text: profileController.currentUser.value.phoneNumber);
    TextEditingController about =
    TextEditingController(text: profileController.currentUser.value.about);
    ImagePickerController imagePickerController =
    Get.put(ImagePickerController());
    RxString imagePath = "".obs;

    AuthController authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authController.logoutUser();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(

              padding: const EdgeInsets.all(10),
              // height: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                                  () => isEdit.value
                                  ? InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  imagePath.value =
                                  await imagePickerController
                                      .pickImage(ImageSource.gallery);
                                  if (kDebugMode) {
                                    print("Image Picked${imagePath.value}");
                                  }
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius:
                                    BorderRadius.circular(100),
                                  ),
                                  child: imagePath.value == ""
                                      ? const Icon(
                                    Icons.add,
                                  )
                                      : ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    child: Image.file(
                                      File(imagePath.value),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                                  : Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                  borderRadius:
                                  BorderRadius.circular(100),
                                ),
                                child: profileController.currentUser.value
                                    .profileImage ==
                                    null ||
                                    profileController.currentUser
                                        .value.profileImage ==
                                        ""
                                    ? const Icon(
                                  Icons.image,
                                )
                                    : ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      imageUrl: profileController
                                          .currentUser
                                          .value
                                          .profileImage!,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget:
                                          (context, url, error) =>
                                          const Icon(Icons.error),
                                    )),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Obx(
                              () => TextField(
                            controller: name,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "Name",
                              prefixIcon: const Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                              () => TextField(
                            controller: about,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "About",
                              prefixIcon: const Icon(
                                Icons.info,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          controller: email,
                          enabled: false,
                          decoration: InputDecoration(
                            filled: isEdit.value,
                            labelText: "Email",
                            prefixIcon: const Icon(
                              Icons.mail,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Obx(
                              () => TextField(
                            controller: phone,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "Number",
                              prefixIcon: const Icon(
                                Icons.phone_iphone,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                                  () => isEdit.value
                                  ? PrimaryButton(
                                btnName: "Save",
                                icon: Icons.save,
                                onTap: () async {
                                  await profileController.updateProfile(
                                    imagePath.value,
                                    name.text,
                                    about.text,
                                    phone.text,
                                  );
                                  isEdit.value = false;
                                },
                              )
                                  : PrimaryButton(
                                btnName: "Edit",
                                icon: Icons.edit,
                                onTap: () {
                                  isEdit.value = true;
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}