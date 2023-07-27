import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_firebase/app/data/app_color.dart';

class AuthClass {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  FirebaseAuth auth = FirebaseAuth.instance;
  Future googleSignIn(buildContext) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        try {
          // ignore: unused_local_variable
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
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
        }
      } else {}
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
    }
  }
}
