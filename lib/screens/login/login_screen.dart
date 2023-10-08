import 'package:flashchat/screens/login/login_viewmodel.dart';
import 'package:flashchat/widgets/custom_buttons.dart';
import 'package:flashchat/widgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginViewModel viewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: "logo",
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              Form(
                key: viewModel.logInKey,
                child: Column(
                  children: [
                    CustomTextField13(
                      controller: viewModel.emailController,
                      fillColor: Colors.grey.shade400.withOpacity(.7),
                      hintText: "Enter your email",
                      title: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Obx(
                      () => CustomTextField13(
                        controller: viewModel.passwordController,
                        fillColor: Colors.grey.shade400.withOpacity(.7),
                        hintText: "Enter your password",
                        keyboardType: TextInputType.text,
                        title: "Password",
                        obscureText: viewModel.obsecurePassword.value,
                        sufixIcon: GestureDetector(
                          onTap: () {
                            viewModel.obsecurePassword.value =
                                !viewModel.obsecurePassword.value;
                          },
                          child: viewModel.obsecurePassword.value
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: CustomButton8(
                      onPressed: () {
                        viewModel.loginBtn();
                      },
                      backgroundColor: Colors.lightBlueAccent,
                      text: "LOGIN",
                      textColor: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
