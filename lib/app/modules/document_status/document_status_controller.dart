import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_tasks_moel/get_all_tasks_model.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class DocumentStatusController extends BaseController {
  Tasks? task;
  @override
  void onInit() {
    if (Get.arguments != null) {
      task = Get.arguments['task'];
    }
    super.onInit();
  }
}
