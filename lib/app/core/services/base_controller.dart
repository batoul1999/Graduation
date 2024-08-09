import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_docs_model/get_all_docs_model.dart';
import 'package:graduation/app/core/enums/file_type_enum.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/global/shared/maps_data.dart';
import 'package:image_picker/image_picker.dart';

class BaseController extends GetxController {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  RxBool success = false.obs;
  RxBool completed = false.obs;

  RxString errorMessage = ''.obs;
  Rx<RequestStatus> requestStatus = RequestStatus.defaultt.obs;
  RxList<OperationType> operationType = <OperationType>[].obs;
  RxList<OperationType> listType = <OperationType>[].obs;
  RxList<Documents> documentsList = <Documents>[].obs;

  final ImagePicker picker = ImagePicker();

  FileModel? selectedFile;
  Future<FileModel> pickFile(
      {required FileTypeEnum type, bool? allowMultiple}) async {
    List<String> paths = [];
    switch (type) {
      case FileTypeEnum.camera:
        final image = await picker.pickImage(source: ImageSource.camera);
        image != null ? paths.add(image.path) : null;

        break;
      case FileTypeEnum.gallery:
        final image = await picker.pickImage(source: ImageSource.gallery);
        image != null ? paths.add(image.path) : null;

        break;
      case FileTypeEnum.file:
        final files = await FilePicker.platform.pickFiles(
          allowMultiple: allowMultiple ?? false,
          type: FileType.custom,
          allowedExtensions: ['png', 'jpeg', 'jpg', 'webp'],
        );
        if (files != null) {
          for (var i = 0; i < files.files.length; i++) {
            final file = files.files[i];
            if (file.extension == 'png' ||
                file.extension == 'jpeg' ||
                file.extension == 'jpg' ||
                file.extension == 'webp') {
              paths.add(file.path!);
            }
          }
        }
        break;
    }
    return paths.isNotEmpty
        ? FileModel(
            paths.isNotEmpty ? paths : selectedFile!.path,
            paths.isNotEmpty ? type : selectedFile!.type,
          )
        : FileModel([], type);
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.none}) async {
    requestStatus.value = RequestStatus.loading;
    operationType.add(type!);
    listType.add(type);
    await function;
    requestStatus.value = RequestStatus.defaultt;
    operationType.remove(type);
    listType.remove(type);
  }

  Future runFullLoadingFutureFunction({
    required Future function,
  }) async {
    customLoader();
    await function;
    BotToast.closeAllLoading();
  }

  void getAllDocuments() {
    documentsList.clear();
    documentsList.addAll(GetAllDocsModel.fromJson(MapsData.docsMap).documents!);
    success.value = true;
  }
}

class FileModel {
  FileTypeEnum type;
  List<String> path;

  FileModel(this.path, this.type);
}
