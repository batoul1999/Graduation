import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/data/repositories/hive_repository.dart';

HiveRepository get localStorage => Get.find<HiveRepository>();

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

double screenWidth(double percent) {
  return Get.size.width / percent;
}

double screenHeight(double percent) {
  return Get.size.height / percent;
}
