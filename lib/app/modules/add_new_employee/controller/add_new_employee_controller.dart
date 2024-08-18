import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/departments_models/get_all_departments_model.dart';
import 'package:graduation/app/core/data/repositories/employee_repository.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class AddNewEmployeeController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void onInit() async {
    await getAllDepartments();
    super.onInit();
  }

  void fakeSignUp() {
    runFullLoadingFutureFunction(
        function: Future.delayed(const Duration(seconds: 3)).then(
            (value) => CustomToast.showMessage(message: 'تمت العملية بنجاح')));
  }

  Future<void> createEmployee() async {
    Departments? department = departmentsList
        .firstWhereOrNull((depart) => depart.name == departmentName.value);
    errorMessage.value='';
    if (department != null) {
      await runFullLoadingFutureFunction(
          function: EmployeeRepository()
              .createEmployee(
                  departmentId: department.id!,
                  password: passwordController.text,
                  userName: nameController.text)
              .then((value) {
        if (value.$1 != null) {
          errorMessage.value = value.$1!;
        } else if (value.$2 != null) {
          nameController.clear();
          passwordController.clear();
          departmentName.value = 'القسم';
          CustomToast.showMessage(message: 'تمت العملية بنجاح',messagetype: MessageType.success);
        }
      }));
    } else {
      CustomToast.showMessage(
          message: 'القسم غير موجود', messagetype: MessageType.showInfo);
    }
  }
}
