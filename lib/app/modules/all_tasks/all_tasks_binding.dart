import 'package:get/get.dart';
import 'package:graduation/app/modules/all_tasks/all_tasks_controller.dart';

class AllTasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTasksController>(
      () => AllTasksController(),
    );
  }
}
