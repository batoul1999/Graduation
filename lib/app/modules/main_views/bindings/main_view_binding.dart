import 'package:get/get.dart';
import 'package:graduation/app/modules/main_views/controllers/main_view_controller.dart';

class MainViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainViewController>(
      () => MainViewController(),
    );
  }
}
