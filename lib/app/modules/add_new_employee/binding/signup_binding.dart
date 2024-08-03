import 'package:get/get.dart';
import 'package:graduation/app/modules/add_new_employee/controller/add_new_employee_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewEmployeeController>(
      () => AddNewEmployeeController(),
    );
  }
}
