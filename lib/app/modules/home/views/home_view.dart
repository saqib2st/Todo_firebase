import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/data/custom_textstyle.dart';
import 'package:todo_firebase/app/modules/home/views/widgets/chip_widget.dart';
import 'package:todo_firebase/app/modules/signup/views/widgets/custom_button.dart';
import 'package:todo_firebase/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.08,
        automaticallyImplyLeading: true,
        backgroundColor: AppColor.secondaryColor,
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () => Get.offAllNamed(Routes.login),
              child: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          height: Get.height * 1,
          width: Get.width * 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Color.fromARGB(255, 255, 255, 253),
            Color.fromARGB(255, 255, 242, 207),
          ])),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create a new \n Todo',
                  style: CustomTestStyle.blackTest16B
                      .copyWith(fontSize: 26, color: AppColor.primaryColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Title',
                  style: CustomTestStyle.blackTest14B,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: AppColor.secondaryColor, width: 2),
                  ),
                  child: TextField(
                    controller: controller.titleController,
                    decoration: const InputDecoration(
                      hintText: 'Task title here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(alignment: WrapAlignment.end, spacing: 60, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 98),
                    child: Wrap(
                      spacing: 15,
                      children: [
                        ChipWidget(
                          type: 'Planing',
                          onTap: () {
                            controller.onChipPressSetType('Planing');
                          },
                        ),
                        ChipWidget(
                            onTap: () {
                              controller.onChipPressSetType('Important');
                            },
                            type: 'Important',
                            color: AppColor.primaryColorLight)
                      ],
                    ),
                  ),
                  Obx(() => Column(
                        children: [
                          controller.selectedImage.value == ''
                              ? Image.asset(
                                  'assets/logo/img.png',
                                  height: 110,
                                  width: 110,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  File(controller.selectedImage.value),
                                  height: 110,
                                  width: 110,
                                  fit: BoxFit.fill,
                                ),
                          Container(
                              height: 27,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: AppColor.lightpurple,
                                  borderRadius: BorderRadius.circular(5)),
                              child: InkWell(
                                onTap: () => controller.onImageSelect(),
                                child: const Wrap(
                                  spacing: 5,
                                  alignment: WrapAlignment.center,
                                  runAlignment: WrapAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        'Add Image',
                                        style: TextStyle(
                                            color: AppColor.darkpurple,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      )),
                ]),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Description',
                  style: CustomTestStyle.blackTest14B,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: AppColor.secondaryColor, width: 2),
                  ),
                  child: TextField(
                    controller: controller.descriptionController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Some Description here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Catogery',
                  style: CustomTestStyle.blackTest14B,
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    ChipWidget(
                        onTap: () {
                          controller.onChipPressSetCatogary('Food');
                        },
                        type: 'Food'),
                    ChipWidget(
                        onTap: () {
                          controller.onChipPressSetCatogary('Shopping');
                        },
                        type: 'Shopping',
                        color: AppColor.primaryColorLight),
                    ChipWidget(
                        onTap: () {
                          controller.onChipPressSetCatogary('Code');
                        },
                        type: 'Code'),
                    ChipWidget(
                        onTap: () {
                          controller.onChipPressSetCatogary('Design');
                        },
                        type: 'Design'),
                    ChipWidget(
                        onTap: () {
                          controller.onChipPressSetCatogary('Workout');
                        },
                        type: 'Workout'),
                    ChipWidget(
                      onTap: () {
                        controller.onChipPressSetCatogary('Run');
                      },
                      type: 'Run',
                      color: AppColor.amberacent,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomButton(
                      height: Get.height * 0.05,
                      width: Get.width * 0.7,
                      title: 'Add Todo',
                      onPress: () => controller.onpressaddTodo()),
                ),
              ],
            ),
          )),
    );
  }
}
