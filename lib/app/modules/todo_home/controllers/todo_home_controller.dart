import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/modules/home/controllers/home_controller.dart';

class TodoHomeController extends GetxController {
  RxBool value = true.obs;

  // ignore: unused_field
  final HomeController _homeController = Get.put(HomeController());

  readUsers() {
    return FirebaseFirestore.instance.collection('Todo').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => User.fromJson(doc.id, doc.data()))
            .toList());
  }

  onDeletePress(String documentId) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Todo').doc(documentId);
      await docRef.delete();
      Get.snackbar('Success', 'Document deleted successfully');
    } catch (e) {
      Get.snackbar('Fails', 'Error deleting document: $e');
    }
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String type = "";
  String catogery = "";
  RxString isBorder = "".obs;
  RxString isBorderctgry = "".obs;
  String id = '';
  Rx<BorderSide> borderSide = const BorderSide(
          strokeAlign: BorderSide.strokeAlignInside,
          color: AppColor.darkpurple,
          width: 2)
      .obs;

  onChipPressSetType(String typestr) {
    type = typestr;
    isBorder.value = typestr;
  }

  onChipPressSetCatogary(String catogarystr) {
    catogery = catogarystr;
    isBorderctgry.value = catogarystr;
  }

  onpressaddTodo(String docId) async {
    id = docId;
    final docUser = FirebaseFirestore.instance.collection('Todo').doc(id);
    final json = {
      "title": titleController.text,
      "description": descriptionController.text,
      "type": type,
      "catogery": catogery,
      "id": id,
    };
    await docUser.set(json);

    Get.snackbar(
      'Success',
      'Todo Created Successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  onTilePress(String documentId) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Todo').doc(documentId);
      final result = await docRef.get();
      return result;
    } catch (e) {
      Get.snackbar('Fails', 'Error deleting document: $e');
    }
  }
}

class User {
  String? type = "", catogery = "", title, description, documentId, url;
  User(
      {this.title,
      this.description,
      this.catogery,
      this.type,
      this.url,
      this.documentId});

  static User fromJson(String documentId, Map<String, dynamic> json) => User(
      title: json['title'],
      description: json['description'],
      catogery: json['catogery'],
      type: json['type'],
      documentId: documentId,
      url: json['image_url']);
}
