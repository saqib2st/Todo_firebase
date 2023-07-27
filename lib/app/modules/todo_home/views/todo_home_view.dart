import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/modules/todo_home/controllers/todo_home_controller.dart';
import 'package:todo_firebase/app/modules/todo_home/views/widgets/todo_card.dart';
import 'package:todo_firebase/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

class TodoHomeView extends GetView<TodoHomeController> {
  const TodoHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.secondaryColor,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 105, 105, 105),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () => Get.toNamed(Routes.home),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 72, 132, 161),
                              Color.fromARGB(255, 137, 168, 184),
                              Color.fromARGB(255, 185, 214, 216),
                              Color.fromARGB(255, 212, 225, 226),
                              Color.fromARGB(255, 209, 208, 208)
                            ])),
                    child: const Icon(Icons.add)),
              ),
              label: 'Add'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed'),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 14),
        height: Get.height * 1,
        width: Get.width * 1,
        color: AppColor.scaffoldColor,
        child: StreamBuilder<List<User>>(
          stream: controller.readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final todoList = snapshot.data;
              return ListView.builder(
                itemCount: todoList!.length,
                itemBuilder: (context, index) {
                  final todo = todoList[index];
                  return TodoCard(
                    title: todo.title,
                    time: DateFormat.MMMd().format(DateTime.now()),
                    type: todo.type,
                    catogery: todo.catogery,
                    subtitle: todo.description,
                    id: todo.documentId,
                    leading: todo.url,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text('Error fetching data');
            } else {
              return const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
