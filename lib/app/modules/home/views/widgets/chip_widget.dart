import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/modules/home/controllers/home_controller.dart';

class ChipWidget extends GetView<HomeController> {
  const ChipWidget(
      {super.key, required this.type, this.color, required this.onTap});

  final String type;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: onTap,
          child: Chip(
            label: Text(type),
            backgroundColor: color ?? AppColor.lightpurple,
            side: getBorderSide(),
          ),
        ));
  }

  BorderSide getBorderSide() {
    if (controller.isBorder.value == type ||
        controller.isBorderctgry.value == type) {
      return controller.borderSide.value;
    } else {
      return BorderSide.none;
    }
  }
}
