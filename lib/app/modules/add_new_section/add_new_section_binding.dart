import 'package:get/get.dart';
import 'package:graduation/app/modules/add_new_section/add_nw_section_controller.dart';

class AddNewSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNwSectionController>(
      () => AddNwSectionController(),
    );
  }
}
