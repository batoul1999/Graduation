import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/task_models/get_task_by_id.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class DocumentStatusController extends BaseController {
  GetTaskByIdModel? task;
  String? state;
  @override
  void onInit() {
    if (Get.arguments != null) {
      task = Get.arguments['task'];
      state= Get.arguments['state'];
    }
    super.onInit();
  }
}
