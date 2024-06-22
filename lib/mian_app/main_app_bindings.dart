import 'package:get/get.dart';
import 'package:graduation/mian_app/mian_app_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainAppController(), permanent: true);
  }
}
