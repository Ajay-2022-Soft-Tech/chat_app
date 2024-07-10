import 'package:chat_app/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;


  //  From this the data you entered in Signup section
  //  displayed on profile section
  Rx<UserModel> currentUser = UserModel().obs;

  void onInit()async{
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails()async{

    await db.collection("users")
        .doc(auth.currentUser!.uid)
        .get()
    .then((value)=>{
      currentUser.value = UserModel.fromJson(value.data()!),
    })
    ;
  }

}