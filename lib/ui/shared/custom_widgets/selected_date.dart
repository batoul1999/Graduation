import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedDate extends GetxController {
  final Rx<DateTime?> date = Rx(null);

  void pickDate() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 1),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      date.value = pickedDate;
    }
  }
}