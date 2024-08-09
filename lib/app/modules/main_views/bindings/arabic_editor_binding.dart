import 'package:get/get.dart';
import 'package:graduation/app/modules/main_views/controllers/arabic_editor_controller.dart';

class ArabicEditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArabicEditorController>(
      () => ArabicEditorController(),
    );
  }
}
