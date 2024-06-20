import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/ui/start_view/start_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(540, 960),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, _) {
          return GetMaterialApp(
            home: StartView(),
          );
        });
  }
}
