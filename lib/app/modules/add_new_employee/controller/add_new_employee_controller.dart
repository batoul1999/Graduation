import 'package:flutter/material.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class AddNewEmployeeController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  void fakeSignUp() {
    runFullLoadingFutureFunction(
        function: Future.delayed(const Duration(seconds: 3))
            .then((value) => CustomToast.showMessage(message: 'تمت العملية بنجاح')));
  }
}
