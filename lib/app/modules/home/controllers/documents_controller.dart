import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_docs_model/get_all_docs_model.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class DocumentsController extends BaseController {
  TextEditingController todoController = TextEditingController();
  GlobalKey<FormState> todoKey = GlobalKey();

  @override
  void onInit() {
    completed.value = false;
    loadDocuments();
    super.onInit();
  }

  //RxBool isChanged = false.obs;

  RxList<Documents> filteredList = <Documents>[].obs;
  void filterDocuments(String searchQuery) {
    filteredList.clear();
    filteredList.addAll(documentsList.where((document) {
      return document.name!.contains(searchQuery);
    }).toList());
  }

  bool get isAllDocumentsLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllDocuments);

  Future<void> loadDocuments() async {
    await runLoadingFutureFunction(
        type: OperationType.getAllDocuments,
        function: Future.delayed(const Duration(seconds: 3))
            .then((value) => getAllDocuments()));
  }
}
