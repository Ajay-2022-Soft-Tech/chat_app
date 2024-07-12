import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Config/ImagePicker.dart';
import 'package:chat_app/Controller/AuthController.dart';
import 'package:chat_app/Controller/ProfileController.dart';
import 'package:chat_app/Widget/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    RxBool isEdit = false.obs;
    ProfileController profileController = Get.put(ProfileController());

    TextEditingController name = TextEditingController(text: profileController.currentUser.value.name);
    TextEditingController email = TextEditingController(text: profileController.currentUser.value.email);
    TextEditingController phone = TextEditingController(text: profileController.currentUser.value.phoneNumber);
    TextEditingController about = TextEditingController(text: profileController.currentUser.value.about);

    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    RxString imagePath ="".obs;
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile'),
        actions: [
          IconButton(
              onPressed: (){
                authController.logOutUser();

              },
              icon: Icon(Icons.login_outlined)
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children : [
            Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                    borderRadius:BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(()=> isEdit.value?
                              InkWell(
                                onTap: ()async{
                                  imagePath.value = await imagePickerController.pickImage();
                                  print("Image picked"+imagePath.value);

                                }
                                ,
                                child:Container(
                                  width: 150,
                                    height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    shape: BoxShape.circle
                                  ),
                                  child: imagePath.value==""
                                      ?Icon(Icons.edit)
                                      : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                        child: Image.file(
                                        File(imagePath.value),
                                          fit: BoxFit.cover,

                                                                          ),
                                      ),

                                ),

                              ):Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    shape: BoxShape.circle
                                ),
                                child: profileController.currentUser.value.profileImage ==null || profileController.currentUser.value.profileImage ==""
                                    ?Icon(Icons.camera_alt)
                                    : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:CachedNetworkImage(
                                    imageUrl: profileController.currentUser.value.profileImage!,
                                    fit: BoxFit.cover,
                                    width: 70,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  )

                                ),

                              ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Obx(()=>
                              TextField(
                                controller: name,
                                enabled: isEdit.value,
                                decoration: InputDecoration(
                                    filled: isEdit.value,
                                    labelText: 'Name',
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Name',
                                    contentPadding: EdgeInsets.symmetric(vertical: 15)
                                ),
                              ),),
                          SizedBox(height: 10,),
                          Obx(()=>TextField(
                            controller: about,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                                filled: isEdit.value,
                                labelText: 'About',
                                prefixIcon: Icon(Icons.info_outline),
                                hintText: 'I Am Ghost',
                                contentPadding: EdgeInsets.symmetric(vertical: 15)
                            ),
                          ),),
                          SizedBox(height: 10,),
                          TextField(
                            controller: email,
                            enabled: false,
                            decoration: InputDecoration(
                                filled: isEdit.value,
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Email@gmail.com',
                                contentPadding: EdgeInsets.symmetric(vertical: 15)
                            ),
                          ),
                          SizedBox(height: 10,),
                          Obx(()=>
                              TextField(
                                controller: phone,
                                enabled: isEdit.value,
                                decoration: InputDecoration(
                                    filled: isEdit.value,
                                    labelText: 'Phone',
                                    prefixIcon: Icon(Icons.phone),
                                    hintText: '9999999999',
                                    contentPadding: EdgeInsets.symmetric(vertical: 15)
                                ),
                              ),
                          ),
                          SizedBox(height: 20,),
                          Obx(()=>
                          profileController.isLoading.value ? CircularProgressIndicator():
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(()=>
                              isEdit.value ? PrimaryButton(
                                  btnName: 'Save',
                                  icon: Icons.save,
                                  onTap: ()async{
                                    await profileController.updateProfile(imagePath.value, name.text, about.text, phone.text);
                                    isEdit.value = false;

                                  }):
                              PrimaryButton(
                                  btnName: 'Edit',
                                  icon: Icons.edit,
                                  onTap: (){
                                    isEdit.value = true;

                                  })
                              ),
                            ],
                          ),
                          ),
                          SizedBox(height: 20,),



                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          ]
        ),
      ),
    );
  }
}
