import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/screens/chat/chat_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends GetxController {
  GlobalKey<FormState> logInKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool obsecurePassword = true.obs;

  final auth = FirebaseAuth.instance;

  loginBtn() async {
    try {
      if (logInKey.currentState!.validate()) {
        await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Get.offAll(() => ChatScreen());
      } else {}
    } catch (e) {}
  }
}
