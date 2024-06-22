import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/routes/app_pages.dart';
import 'package:graduation/mian_app/main_app_bindings.dart';
import 'package:graduation/mian_app/mian_app_controller.dart';

class MainApp extends GetView<MainAppController> {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        title: "Graduation",
        initialRoute:Routes.LOGIN,
          //  prefStorage.getFirstLogin() == false ? Routes.LOGIN : Routes.HOME,
        getPages: AppPages.routes,
        initialBinding: MainBindings(),
      ),
    );
  }
}
