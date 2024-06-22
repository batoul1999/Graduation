import 'package:flutter/widgets.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class AddNewTodoController extends BaseController {
  TextEditingController todoController = TextEditingController();
  GlobalKey<FormState> todoKey = GlobalKey();
  void addNew() {
    success.value = true;

    // runFullLoadingFutureFunction(
    //     function: TodosDocsRepository()
    //         .addNew(
    //             userId: prefStorage.getLoginModel()!.id!,
    //             todo: todoController.text,
    //             completed: completed.value)
    //         .then((value) {
    //   if (value.$1 != null) {
    //     errorMessage.value = value.$1!;
    //     success.value = false;
    //   } else if (value.$2 != null) {
    //     CustomToast.showMessage(
    //         message: 'Added successfuly', messagetype: MessageType.success);
    //   }
    // }));
  }

  @override
  void onInit() {
    completed.value = false;
    super.onInit();
  }
}
