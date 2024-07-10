import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Model/UserModel.dart';

class AuthController extends GetxController{

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  //  For Login

  Future<void> login(String email, String password)async{

    isLoading.value = true;
    try{

    await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    Get.offAllNamed('/homePage');
    print('account created 🔥🔥');
    } on FirebaseAuthException catch (e){
      if (e.code =='Weak-Password'){
        print('The password provided is too weak');

      }
      if (e.code=='user not found'){
        print('Wrong password for that email');
      }
      else if (e.code =='email-already-in-use'){
        print("The account already exists for that email");
      }
      else if (e.code =='Wrong password'){
        print("Wrong password provided for that user");
      }
      else {
        print(e.code);
      }
    }catch(e){
      print(e);
    }
    isLoading.value = false;
  }



  Future<void> createUser(String email, String password,String name)async {
    isLoading.value = true;

    try{
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      await initUser(email,name);
      Get.offAllNamed('/homePage');
      print('account created 🔥🔥');


    }on FirebaseAuthException catch (e){
      if (e.code =='Weak-Password'){
        print('The password provided is too weak');

      }

      else if (e.code =='email-already-in-use'){
        print("The account already exists for that email");
      }
    }
    catch(e){
      print(e);
    }
    isLoading.value = false;

  }


  Future<void> logOutUser()async{

    await auth.signOut();
    Get.offAllNamed("/loginPage");
  }


  // creating user in firebase database
  Future<void> initUser(String email,String name)async{

    var newUser = UserModel(

      email: email,
      name: name,
      id: auth.currentUser!.uid,
      // phoneNumber: auth.currentUser!.phoneNumber,
      // profileImage: auth.currentUser!.photoURL,
    );

    try{
      await db.collection("users").doc(auth.currentUser!.uid).set(newUser.toJson());

    }
    catch(e){
      print(e.toString());
    }

  }

}