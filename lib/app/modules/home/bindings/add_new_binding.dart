import 'package:get/get.dart';
import 'package:graduation/app/modules/home/controllers/documents_controller.dart';

class AddNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentsController>(
      () => DocumentsController(),
    );
  }
}
