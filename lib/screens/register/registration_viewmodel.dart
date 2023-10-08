import 'package:flashchat/screens/chat/chat_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationViewModel extends GetxController {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool obsecurePassword = true.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  registrationBtn() async {
    if (registerKey.currentState!.validate()) {
      
    }
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAll(() => ChatScreen());
    } catch (e) {}
  }
}
