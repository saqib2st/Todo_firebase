import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/data/services/auth_services.dart';
import 'package:todo_firebase/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  AuthClass authClass = AuthClass();

  onbuttonPress() async {
    try {
      // ignore: unused_local_variable
      firebase_auth.UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: emailController.text, password: passWordController.text);
      isLoading.value = !isLoading.value;
      Get.toNamed(Routes.todoHome);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: const Color.fromARGB(132, 155, 206, 210),
          colorText: AppColor.secondaryColor,
          titleText: const Text(
            'Eorror',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.secondaryColor),
          ));
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  signInWithGoogle(context) async {
    await authClass.googleSignIn(context);
    Get.offAndToNamed(Routes.home);
  }
}
