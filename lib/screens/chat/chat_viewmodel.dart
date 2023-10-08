import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatViewModel extends GetxController {
  GlobalKey<FormState> msgKey = GlobalKey<FormState>();
  TextEditingController messagecontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  late User user;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  getCurrentUser() async {
    try {
      if (auth.currentUser != null) {
        user = auth.currentUser!;
        print(user.email);
      }
    } catch (e) {}
  }

  getMessages() async {
    // try {
    //   final firestore = FirebaseFirestore.instance;
    //   var mp;
    //   final messges = await firestore
    //       .collection('message')
    //       .get()
    //       .then((value) {
    //     mp = value;
    //     print(mp);
    //   });
    //   for (var element in messges.docs) {
    //     print(element);
    //   }
    // } catch (e) {
    //   print("Error Occured");
    // }
  }

  messageStreams() async {
    final firestore = FirebaseFirestore.instance;
    // final messges = await firestore.collection('message').doc(user.uid).get();
    await for (var snapshot in firestore.collection('message').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  sendBtn() async {
    if (msgKey.currentState!.validate()) {
      final firestore = FirebaseFirestore.instance;
      final collection = firestore.collection("message");
      final store = collection;
      store.add(
        {
          "sender": user.email,
          "text": messagecontroller.text,
        },
      );
      messagecontroller.clear();
    }
  }
}
