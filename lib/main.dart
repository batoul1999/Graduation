import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/data/repositories/hive_repository.dart';
import 'package:graduation/core/util.dart';
import 'package:graduation/my_app/my_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HiveRepository());
  await localStorage.init();
  runApp(const MyApp());
}
