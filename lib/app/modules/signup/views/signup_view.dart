import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/data/custom_textstyle.dart';
import 'package:todo_firebase/app/data/static_assets.dart';
import 'package:todo_firebase/app/modules/signup/views/widgets/custom_button.dart';
import 'package:todo_firebase/app/modules/signup/views/widgets/text_field.dart';
import 'package:todo_firebase/app/routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.secondaryColor,
        title: Text(
          'SIGNUP',
          style: CustomTestStyle.blackTest16B
              .copyWith(color: AppColor.primaryBackgroundColor),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        height: Get.height * 0.6,
        width: Get.width * 0.85,
        decoration: BoxDecoration(
            color: AppColor.scaffoldColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.2),
                spreadRadius: 0.6,
                blurRadius: 3.5,
                offset: const Offset(1, 5),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12).copyWith(left: 1),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: AppColor.primaryColor,
                          width: 5,
                          style: BorderStyle.solid))),
              child: Text(
                'SIGN UP',
                style: CustomTestStyle.blackTest16B.copyWith(
                  fontSize: 22,
                  color: const Color.fromARGB(255, 234, 84, 84),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Column(
              children: [
                CustomeTextField(
                  hintText: 'Enter Email ....',
                  textController: controller.emailController,
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomeTextField(
                  hintText: 'Password',
                  textController: controller.passWordController,
                  obsecure: true,
                ),
                const SizedBox(
                  height: 42,
                ),
                Obx(() => !controller.isLoading.value
                    ? CustomButton(
                        title: 'Sign Up',
                        height: Get.height * 0.045,
                        width: Get.width * 0.74,
                        fontSize: 16,
                        onPress: () => controller.onbuttonPress(),
                      )
                    : const CircularProgressIndicator()),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      title: 'Signup with Google',
                      icon: StaticAsset.googleLogo,
                      onPress: () => controller.signInWithGoogle(context),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CustomButton(
                      title: 'Signup with Phone',
                      icon: StaticAsset.phoneLogo,
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text.rich(
                  TextSpan(
                      text: 'Do you have already an account ?',
                      style: CustomTestStyle.blackTest12,
                      children: [
                        const WidgetSpan(
                            child: SizedBox(
                          width: 8,
                        )),
                        WidgetSpan(
                            child: InkWell(
                          onTap: () => Get.offAndToNamed(Routes.login),
                          child: Text(
                            'Login',
                            style: CustomTestStyle.blackTest12M
                                .copyWith(color: AppColor.primaryColor),
                          ),
                        ))
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Forgot Password',
                  style: CustomTestStyle.blackTest12B
                      .copyWith(color: AppColor.secondaryColor),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
