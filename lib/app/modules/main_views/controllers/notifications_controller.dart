import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class NotificationsController extends BaseController {
  // Future<void> getTodosByUserId() async {
  //   errorMessage.value = '';
  //   success.value = false;

  //   // await TodosDocsRepository()
  //   //     .getAllByUserId(userId: prefStorage.getLoginModel()!.id!)
  //   //     .then((value) {
  //   //   if (value.$1 != null) {
  //   //     errorMessage.value = value.$1!;
  //   //     success.value = true;
  //   //   } else if (value.$2 != null) {
  //   //     todosList.clear();
  //   //     todosList.addAll(value.$2!.todos!);
  //   //     success.value = true;
  //   //   }
  //   // });
  // }

  @override
  void onInit() async {
    await getAllNotifications();
    super.onInit();
  }

  bool get isAllNotificationsLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllNotifications);

  Future<void> getAllNotifications() async {
    await runLoadingFutureFunction(
        type: OperationType.getAllNotifications,
        function: Future.delayed(const Duration(seconds: 3))
            .then((value) => getAllDocuments()));
  }
}
