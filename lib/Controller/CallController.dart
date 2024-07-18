import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../Model/AudioCall.dart';
import '../Model/UserModel.dart';
import '../Pages/SplashPage/CallPage/AudioCallPage.dart';
import '../Pages/SplashPage/CallPage/VideoCall.dart';

class CallController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final uuid = const Uuid().v4();

  @override
  void onInit() {
    super.onInit();

    getCallsNotification().listen((List<CallModel> callList) {
      if (callList.isNotEmpty) {
        var callData = callList[0];
        if (callData.type == "audio") {
          audioCallNotification(callData);
        } else if (callData.type == "video") {
          videoCallNotification(callData);
        }
      }
    });
  }

  Future<void> audioCallNotification(CallModel callData) async {
    Get.rawSnackbar(
      duration: const Duration(days: 1),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[900]!,
      isDismissible: false,
      icon: const Icon(Icons.call),
      titleText: Text(callData.callerName ?? "Unknown"),
      messageText: const Text("Incoming Audio Call"),
      mainButton: TextButton(
        onPressed: () {
          endCall(callData);
          Get.back();
        },
        child: const Text("End Call"),
      ),
      onTap: (snack) {
        Get.back();
        Get.to(
          AudioCallPage(
            target: UserModel(
              id: callData.callerUid,
              name: callData.callerName,
              email: callData.callerEmail,
              profileImage: callData.callerPic,
            ),
          ),
        );
      },
    );
  }

  Future<void> callAction(UserModel receiver, UserModel caller, String type) async {
    String id = uuid;
    DateTime timestamp = DateTime.now();
    String nowTime = DateFormat('hh:mm a').format(timestamp);
    var newCall = CallModel(
      id: id,
      callerName: caller.name,
      callerPic: caller.profileImage,
      callerUid: caller.id,
      callerEmail: caller.email,
      receiverName: receiver.name,
      receiverPic: receiver.profileImage,
      receiverUid: receiver.id,
      receiverEmail: receiver.email,
      status: "dialing",
      type: type,
      time: nowTime,
      timestamp: timestamp.toIso8601String(),
    );

    try {
      await db
          .collection("notification")
          .doc(receiver.id)
          .collection("call")
          .doc(id)
          .set(newCall.toJson());
      await db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("calls")
          .add(newCall.toJson());
      await db
          .collection("users")
          .doc(receiver.id)
          .collection("calls")
          .add(newCall.toJson());
      Future.delayed(const Duration(seconds: 20), () {
        endCall(newCall);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Stream<List<CallModel>> getCallsNotification() {
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      return Stream.error("User is not authenticated");
    }

    return db
        .collection("notification")
        .doc(currentUser.uid)
        .collection("call")
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => CallModel.fromJson(doc.data()))
        .toList());
  }

  Future<void> endCall(CallModel call) async {
    try {
      await db
          .collection("notification")
          .doc(call.receiverUid)
          .collection("call")
          .doc(call.id)
          .delete();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void videoCallNotification(CallModel callData) {
    Get.rawSnackbar(
      duration: const Duration(days: 1),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[900]!,
      isDismissible: false,
      icon: const Icon(Icons.video_call),
      titleText: Text(callData.callerName ?? "Unknown"),
      messageText: const Text("Incoming Video Call"),
      mainButton: TextButton(
        onPressed: () {
          endCall(callData);
          Get.back();
        },
        child: const Text("End Call"),
      ),
      onTap: (snack) {
        Get.back();
        Get.to(
          VideoCallPage(
            target: UserModel(
              id: callData.callerUid,
              name: callData.callerName,
              email: callData.callerEmail,
              profileImage: callData.callerPic,
            ),
          ),
        );
      },
    );
  }
}
