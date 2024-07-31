import 'package:get/get.dart';
import 'package:graduation/app/modules/document_details/controller/document_details_controller.dart';

class DocumentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentDetailsController>(
      () => DocumentDetailsController(),
    );
  }
}
