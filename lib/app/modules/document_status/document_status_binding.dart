import 'package:get/get.dart';
import 'package:graduation/app/modules/document_status/document_status_controller.dart';

class DocumentStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentStatusController>(
      () => DocumentStatusController(),
    );
  }
}
