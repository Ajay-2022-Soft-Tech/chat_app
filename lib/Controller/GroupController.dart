import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../Config/CustomMessage.dart';
import '../Model/ChatModel.dart';
import '../Model/GroupModel.dart';
import '../Model/UserModel.dart';
import '../Pages/SplashPage/HomePage/HomePage.dart';
import 'ProfileController.dart';

class GroupController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  var uuid = Uuid();
  RxBool isLoading = false.obs;
  RxString selectedImagePath = "".obs;
  RxList<GroupModel> groupList = <GroupModel>[].obs;
  ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() {
    super.onInit();
    getGroups();
  }

  void selectMember(UserModel user) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  Future<void> createGroup(String groupName, String imagePath) async {
    isLoading.value = true;
    String groupId = uuid.v6();
    groupMembers.add(
      UserModel(
        id: auth.currentUser!.uid,
        name: profileController.currentUser.value.name,
        profileImage: profileController.currentUser.value.profileImage,
        email: profileController.currentUser.value.email,
        role: "admin",
      ),
    );
    try {
      String imageUrl = await profileController.uploadFileToFirebase(imagePath);

      await db.collection("groups").doc(groupId).set(
        {
          "id": groupId,
          "name": groupName,
          "profileUrl": imageUrl,
          "members": groupMembers.map((e) => e.toJson()).toList(),
          "createdAt": DateTime.now().toString(),
          "createdBy": auth.currentUser!.uid,
          "timeStamp": DateTime.now().toString(),
        },
      );
      getGroups();
      successMessage("Group Created");
      Get.offAll(HomePage());
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getGroups() async {
    isLoading.value = true;
    List<GroupModel> tempGroup = [];
    await db.collection('groups').get().then(
          (value) {
        tempGroup = value.docs
            .map(
              (e) => GroupModel.fromJson(e.data()),
        )
            .toList();
      },
    );
    groupList.clear();
    groupList.value = tempGroup
        .where(
          (e) => e.members!.any(
            (element) => element.id == auth.currentUser!.uid,
      ),
    )
        .toList();
    isLoading.value = false;
  }

  Stream<List<GroupModel>> getGroupss() {
    isLoading.value = true;
    return db.collection('groups').snapshots().map((snapshot) {
      List<GroupModel> tempGroup = snapshot.docs
          .map((doc) => GroupModel.fromJson(doc.data()))
          .toList();
      groupList.clear();
      groupList.value = tempGroup
          .where((group) => group.members!.any((member) => member.id == auth.currentUser!.uid))
          .toList();
      isLoading.value = false;
      return groupList;
    });
  }

  Future<void> sendGroupMessage(
      String message, String groupId, String imagePath) async {
    isLoading.value = true;
    var chatId = uuid.v6();
    String imageUrl =
    await profileController.uploadFileToFirebase(selectedImagePath.value);
    var newChat = ChatModel(
      id: chatId,
      message: message,
      imageUrl: imageUrl,
      senderId: auth.currentUser!.uid,
      senderName: profileController.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );
    await db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .doc(chatId)
        .set(
      newChat.toJson(),
    );
    selectedImagePath.value = "";
    isLoading.value = false;
  }

  Stream<List<ChatModel>> getGroupMessages(String groupId) {
    return db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
          .map(
            (doc) => ChatModel.fromJson(doc.data()),
      )
          .toList(),
    );
  }

  Future<void> addMemberToGroup(String groupId, UserModel user) async {
    isLoading.value = true;
    await db.collection("groups").doc(groupId).update(
      {
        "members": FieldValue.arrayUnion([user.toJson()]),
      },
    );
    getGroups();
    isLoading.value = false;
  }
}