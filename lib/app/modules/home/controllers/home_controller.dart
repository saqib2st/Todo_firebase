import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'dart:io';

class HomeController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String type = "";
  String catogery = "";
  RxString isBorder = "".obs;
  RxString isBorderctgry = "".obs;
  Rx<BorderSide> borderSide = const BorderSide(
          strokeAlign: BorderSide.strokeAlignInside,
          color: AppColor.darkpurple,
          width: 2)
      .obs;
  RxString selectedImage = "".obs;
  RxString url = ''.obs;

  Rx<PlatformFile?> pickedFile = PlatformFile(name: '', size: 0).obs;

  onChipPressSetType(String typestr) {
    type = typestr;
    isBorder.value = typestr;
  }

  onChipPressSetCatogary(String catogarystr) {
    catogery = catogarystr;
    isBorderctgry.value = catogarystr;
  }

  onpressaddTodo() async {
    saveImageToFirebase();
    final docUser = FirebaseFirestore.instance.collection('Todo').doc();
    final json = {
      "title": titleController.text,
      "description": descriptionController.text,
      "type": type,
      "catogery": catogery,
      "id": docUser.id,
      "image_url": url.value
    };
    await docUser.set(json);

    Get.snackbar(
      'Success',
      'Todo Created Successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<String?> saveImageToFirebase() async {
    try {
      final path = 'files/${selectedImage.value}';
      final file = File(selectedImage.value.toString());

      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(file);

      final snapShot = await uploadTask.whenComplete(() => null);
      final urlDownload = await snapShot.ref.getDownloadURL();
      url.value = urlDownload;
      print(urlDownload);
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future onImageSelect() async {
    return Get.defaultDialog(
        title: 'Select Image from',
        content: Column(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColor.lightpurple,
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () async {
                    selectedImage.value = await selectImageFromGallery();
                    if (selectedImage.value != '') {
                      Get.back();
                    } else {
                      Get.back();
                      Get.snackbar('File Selection Error', 'No Image Selected',
                          backgroundColor: AppColor.purple);
                    }
                  },
                  child: const Text(
                    'Gallery',
                    style: TextStyle(
                        color: AppColor.darkpurple,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColor.lightpurple,
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () async {
                    selectedImage.value = await selectImageFromCamera();
                    if (selectedImage.value != '') {
                      Get.back();
                    } else {
                      Get.back();
                      Get.snackbar('File Selection Error', 'No Image Selected',
                          backgroundColor: AppColor.purple);
                    }
                  },
                  child: const Text(
                    'Camera',
                    style: TextStyle(
                        color: AppColor.darkpurple,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ));
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return "";
    }
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
