import 'package:get/get.dart';
import 'package:graduation/app/modules/home/controllers/my_todos_controller.dart';

class MyTodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTodosController>(
      () => MyTodosController(),
    );
  }
}
