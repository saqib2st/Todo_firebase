import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/modules/signup/controllers/signup_controller.dart';

// ignore: must_be_immutable
class CustomeTextField extends GetView<SignupController> {
  final String? hintText;
  final bool obsecure;
  TextEditingController? textController = TextEditingController();

  CustomeTextField(
      {super.key, this.obsecure = false, this.hintText, this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.primaryColor,
              width: 2.0,
            ),
          ),
        ),
        child: TextField(
          obscureText: obsecure,
          controller: textController,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
