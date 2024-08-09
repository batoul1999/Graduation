import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class ArabicEditorController extends BaseController {
  QuillController arabicQuillController = QuillController.basic();
  ScrollController arabicScrollController = ScrollController();
  void fakeSending() {
    if (arabicQuillController.plainTextEditingValue.text.isEmpty) {
      CustomToast.showMessage(
          message: 'الرجاء الإدخال أولا', messagetype: MessageType.rejected);
    } else {
      runFullLoadingFutureFunction(
          function: Future.delayed(const Duration(seconds: 3)).then((value) {
        CustomToast.showMessage(
            message: 'تمت الإضافة بنجاح', messagetype: MessageType.success);
      }));
    }
  }
}
