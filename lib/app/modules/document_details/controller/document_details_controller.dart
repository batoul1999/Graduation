import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/employess_models/get_all_employees_model/get_all_employees_model.dart';
import 'package:graduation/app/core/data/models/apis/templates_models/get_all_templates_model.dart';
import 'package:graduation/app/core/data/repositories/employee_repository.dart';
import 'package:graduation/app/core/data/repositories/task_repository.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class DocumentDetailsController extends BaseController
    with GetTickerProviderStateMixin {
  Templates? document;
  AnimationController? animationController;
  TextEditingController employeeController = TextEditingController();
  RxList<String> imageList = <String>[].obs;
  List<TextEditingController> controllersList = [];
  List<String> noteList = <String>[];

  RxString dateController = ''.obs;
  RxList<String> itemsList = <String>[].obs;
  @override
  void onInit() async {
    if (Get.arguments != null) {
      document = Get.arguments['template'];
      controllersList = List.generate(
          document!.list!.length, (index) => TextEditingController());
    }
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )
      ..forward()
      ..repeat(reverse: true);
    await getAllDepartments();
    await getAllEmployees();
    super.onInit();
  }

  @override
  void dispose() {
    animationController!.dispose();
    for (final controller in controllersList) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> sendTask() async {
    //fillTextEditingContollersWithTexts();
    fillModelData();
    await runFullLoadingFutureFunction(
        function: TaskRepository()
            .create(image: imageList, model: requestModel)
            .then((value) {
      if (value.$1 != null) {
        CustomToast.showMessage(
            message: value.$1 ?? 'no data', messagetype: MessageType.rejected);
      } else if (value.$2 != null) {
        CustomToast.showMessage(
            message: value.$2!.message ?? 'done',
            messagetype: MessageType.success);
                    clearAllData();

      }
    }));
  }

  CreateTaskRequest requestModel = CreateTaskRequest();
  void fillModelData() {
    log(document!.list.toString());
    for (var text in controllersList) {
      log(text.text);
    }
    for (int i = 0; i < document!.list!.length; i++) {
      switch (document!.list![i]) {
        case 'رقم الطلب':
          requestModel.number = controllersList[i].text as int;
          break;
        case 'وصف الطلب':
          requestModel.description = controllersList[i].text;
          break;

        case 'اسم الطالب':
          requestModel.studentName = controllersList[i].text;
          break;

        case 'من السنة':
          requestModel.year = controllersList[i].text;
          break;

        case 'الى السنة':
          requestModel.toYear = controllersList[i].text;
          break;

        case 'الدورة':
          requestModel.course = controllersList[i].text;
          break;

        case 'الرقم الجامعي':
          requestModel.collID = controllersList[i].text as int;
          break;

        case 'القسم':
          requestModel.studentDepart = controllersList[i].text;
          break;

        case 'اسم المادة':
          requestModel.subject = controllersList[i].text;
          break;

        case 'الفصل':
          requestModel.semester = controllersList[i].text;
          break;

        case 'العام الدراسي':
          requestModel.examsYear = controllersList[i].text;
          break;
      }
    }

    requestModel.sender = prefStorage.getLoginModel()!.id;
    requestModel.date = dateController.value;
    requestModel.receiver =
        employeesList.firstWhere((e) => e.userName == userName.value).id;
    requestModel.type = document!.id;
    log(requestModel.toJson().toString());
  }

  fillTextEditingContollersWithTexts() {
    if (controllersList.isNotEmpty) {
      noteList.clear();
      for (TextEditingController c in controllersList) {
        noteList.add('"${c.text}"');
      }
      log(noteList.toString());
    }
  }

  List<Employees> employeesList = <Employees>[];
  Future<void> getAllEmployees() async {
    await runFullLoadingFutureFunction(
        function: EmployeeRepository().getAll().then((value) {
      if (value.$1 != null) {
        CustomToast.showMessage(
            message: value.$1 ?? 'no data', messagetype: MessageType.rejected);
      } else if (value.$2 != null) {
        employeesList.addAll(value.$2!.data!);
        for (var element in employeesList) {
          itemsList.add(element.userName!);
        }
      }
    }));
  }

  void clearAllData() {
    employeeController.clear();
    for (var c in controllersList) {
      c.clear();
    }
    userName.value = '';
    dateController.value = '';
    imageList.clear();
  }
}
