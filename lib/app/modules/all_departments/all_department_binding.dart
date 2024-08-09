import 'package:get/get.dart';
import 'package:graduation/app/modules/all_departments/all_department_controller.dart';

class AllDwpartmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllDepartmentController>(
      () => AllDepartmentController(),
    );
  }
}