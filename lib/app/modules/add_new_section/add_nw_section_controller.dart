import 'package:flutter/material.dart';
import 'package:graduation/app/core/data/repositories/departments_repository.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class AddNwSectionController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController descriptionController = TextEditingController();
  void fakeAdding() {
    runFullLoadingFutureFunction(
        function: Future.delayed(const Duration(seconds: 3)).then((value) =>
            CustomToast.showMessage(
                message: 'تمت الإضافة بنجاح',
                messagetype: MessageType.success)));
  }

  Future<void> createDepartment() async {
    errorMessage.value = '';
    await runFullLoadingFutureFunction(
        function: DepartmentsRepository()
            .createDepartment(
      description: descriptionController.text,
      name: nameController.text,
    )
            .then((value) {
      if (value.$1 != null) {
        errorMessage.value = value.$1!;
      } else if (value.$2 != null) {
        nameController.clear();
        descriptionController.clear();
        CustomToast.showMessage(
            message: 'تمت العملية بنجاح', messagetype: MessageType.success);
      }
    }));
  }
}
