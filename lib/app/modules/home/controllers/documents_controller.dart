import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_docs_model/get_all_docs_model.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class DocumentsController extends BaseController {
  TextEditingController todoController = TextEditingController();
  GlobalKey<FormState> todoKey = GlobalKey();

  @override
  void onInit() {
    completed.value = false;
    getAllDocuments();
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
}
