import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/templates_models/get_all_templates_model.dart';
import 'package:graduation/app/core/data/repositories/templates_repository.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class DocumentsController extends BaseController {
  TextEditingController todoController = TextEditingController();
  GlobalKey<FormState> todoKey = GlobalKey();
  RxList<Templates> templatesList = <Templates>[].obs;
  @override
  void onInit() {
    getAllTemplates();
    super.onInit();
  }

  bool get isAllDocumentsLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllDocuments);

  Future<void> getAllTemplates() async {
    await runLoadingFutureFunction(
        type: OperationType.getAllDocuments,
        function: TemplatesRepository().getAll().then((value) {
          if (value.$1 != null) {
            errorMessage.value = value.$1!;
          } else if (value.$2 != null) {
            templatesList.addAll(value.$2!.data!);
          }
        }));
  }
}
