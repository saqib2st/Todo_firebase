import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/modules/todo_home/controllers/todo_home_controller.dart';
import 'package:todo_firebase/app/modules/todo_home/views/updateView.dart';
import 'package:todo_firebase/app/modules/todo_home/views/widgets/todo_tile_detail_view.dart';

class TodoCard extends GetView<TodoHomeController> {
  const TodoCard(
      {this.contianerbgcolor,
      this.title,
      this.time,
      this.iconColor,
      this.subtitle,
      this.type,
      this.catogery,
      this.leading,
      this.id,
      super.key});

  final Color? contianerbgcolor, iconColor;
  final String? title, time, subtitle, type, catogery, id, leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: const BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) => controller.onDeletePress(id!),
            backgroundColor: AppColor.lightRed,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(5),
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(5),
            icon: Icons.edit,
            label: 'Edit',
            onPressed: (context) => Get.to(() => UpdateTodoView(
                  id: id!,
                )),
            backgroundColor: AppColor.lightGreen,
          ),
        ]),
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            Expanded(
              child: Obx(() => Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: AppColor.primaryColor,
                      checkColor: AppColor.secondaryColor,
                      value: controller.value.value,
                      onChanged: (newValue) {
                        controller.value.value = newValue ?? false;
                      },
                    ),
                  )),
            ),
          ],
        ),
        child: Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.lightpurple,
                ),
                child: ListTile(
                  onTap: () => Get.to(TodoDetailedView(
                    id: id,
                  )),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  title: Text(
                    title ?? "Add Todo Title here",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(subtitle ?? "Some subtitle here"),
                  leading: Container(
                    decoration: BoxDecoration(
                        color: AppColor.amberacent,
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(5),
                    child: leading != ''
                        ? Image.network(leading.toString())
                        : const Icon(Icons.music_note),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type ?? 'planned',
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        catogery.toString(),
                        style: const TextStyle(
                            color: AppColor.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        time ?? "time",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 116, 116, 116),
                            fontSize: 12),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
