import 'package:get/get.dart';
import 'package:graduation/app/modules/main_views/controllers/documents_controller.dart';

class DocumentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentsController>(
      () => DocumentsController(),
    );
  }
}
