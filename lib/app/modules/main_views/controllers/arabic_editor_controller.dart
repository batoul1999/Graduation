import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/repositories/templates_repository.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class ArabicEditorController extends BaseController {
  QuillController arabicQuillController = QuillController.basic();
  ScrollController arabicScrollController = ScrollController();
  RxList<String> dataList = <String>[].obs;
  RxList<String> requiredDepartments = <String>[].obs;
  // GlobalKey<FormState> formKey= GlobalKey();
  TextEditingController departmentController = TextEditingController();
  TextEditingController dataController = TextEditingController();

  @override
  void onInit() async {
    await getAllDepartments();
    itemsList.addAll(departmentsList.map((e) => e.name!).toList());
    super.onInit();
  }

  RxList<String> itemsList = <String>[].obs;
  RxList<String> requiredDataList = <String>[
    'رقم الطلب',
    'وصف الطلب',
    'اسم الطالب',
    'من السنة',
    'الى السنة',
    'الدورة',
    'الرقم الجامعي',
    'القسم',
    'اسم المادة',
    'الفصل',
    'العام الدراسي'
  ].obs;
RxString requiredDataName='البيانات المطلوبة'.obs;
RxInt selectedData=0.obs;
  Future<void> createTemplate() async {
    await runFullLoadingFutureFunction(
        function: TemplatesRepository()
            .create(
                plainText: arabicQuillController.plainTextEditingValue.text,
                dataList: dataList,
                departmentsList: requiredDepartments)
            .then((value) {
      if (value.$1 != null) {
        CustomToast.showMessage(
            message: value.$1!, messagetype: MessageType.rejected);
      } else if (value.$2 != null) {
        arabicQuillController.clear();
        Get.back();
        CustomToast.showMessage(
            message: 'تمت العملية بنجاح', messagetype: MessageType.success);
      }
    }));
  }
}
