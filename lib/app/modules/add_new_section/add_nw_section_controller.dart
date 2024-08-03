import 'package:flutter/material.dart';
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
}
