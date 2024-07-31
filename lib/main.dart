import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/repositories/shared_preference_repository.dart';
import 'package:graduation/app/core/services/fcm_service.dart';
import 'package:graduation/app/core/services/notifications_service.dart';
import 'package:graduation/mian_app/mian_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationsService.initializeNotification();
  await ScreenUtil.ensureScreenSize();
  // Get.put(HiveRepository());
  await Get.putAsync(
    () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );

  Get.put(SharedPrefreanceRepository());
  Get.put(FcmService());
  // await storage.init();
  runApp(const MainApp());
}
