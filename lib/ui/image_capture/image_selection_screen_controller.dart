import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/data/services/base_controller.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectionController extends BaseController {
RxString selectedImage=''.obs;
  final TextEditingController imageUrlController = TextEditingController();
  final Rx<DateTime?> selectedDate = Rx(null);

  // Future<void> pickImage() async {
  //   final imagePicker = ImagePicker();
  //   final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     selectedImage.value = pickedFile.path as RxString;
  //   }
  // }

  // Future<void> pickImageFromCamera() async {
  //   final imagePicker = ImagePicker();
  //   final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
  //   if (pickedFile != null) {
  //     selectedImage.value = pickedFile.path as RxString;
  //   }
  // }

  void pickDate() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 1),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }
}