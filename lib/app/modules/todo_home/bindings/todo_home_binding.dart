import 'package:get/get.dart';

import '../controllers/todo_home_controller.dart';

class TodoHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoHomeController>(
      () => TodoHomeController(),
    );
  }
}
