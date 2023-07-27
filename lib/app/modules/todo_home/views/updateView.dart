import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/data/custom_textstyle.dart';
import 'package:todo_firebase/app/modules/home/views/widgets/chip_widget.dart';

import 'package:todo_firebase/app/modules/signup/views/widgets/custom_button.dart';
import 'package:todo_firebase/app/modules/todo_home/controllers/todo_home_controller.dart';

class UpdateTodoView extends GetView<TodoHomeController> {
  const UpdateTodoView({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
        title: const Text('Edit Todo'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          height: Get.height * 1,
          width: Get.width * 1,
          decoration: const BoxDecoration(color: AppColor.veryLightPurple),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Update Todo',
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
                  height: 26,
                ),
                Wrap(
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
                        color: AppColor.purple),
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
                      title: 'Update Todo',
                      onPress: () => controller.onpressaddTodo(id!)),
                ),
              ],
            ),
          )),
    );
  }
}
