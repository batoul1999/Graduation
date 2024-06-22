import 'package:get/get.dart';
import 'package:graduation/app/modules/home/controllers/all_todos_controller.dart';

class AllTodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTodosController>(
      () => AllTodosController(),
    );
  }
}
