import 'package:graduation/app/core/services/base_controller.dart';

class MyTodosController extends BaseController {
  Future<void> getTodosByUserId() async {
    errorMessage.value = '';
    success.value = false;

    // await TodosDocsRepository()
    //     .getAllByUserId(userId: prefStorage.getLoginModel()!.id!)
    //     .then((value) {
    //   if (value.$1 != null) {
    //     errorMessage.value = value.$1!;
    //     success.value = true;
    //   } else if (value.$2 != null) {
    //     todosList.clear();
    //     todosList.addAll(value.$2!.todos!);
    //     success.value = true;
    //   }
    // });
  }

  @override
  void onInit() {
    getTodosByUserId();
    super.onInit();
  }
}
