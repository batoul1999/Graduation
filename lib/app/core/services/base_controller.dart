import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_docs_model/get_all_docs_model.dart';
import 'package:graduation/app/core/enums/file_type_enum.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
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
    documentsList.addAll(GetAllDocsModel.fromJson(docsMap).documents!);
    success.value = true;
  }

  Map<String, dynamic> docsMap = {
    "documents": [
      {
        "id": 1,
        "name": "مصدقة تخرج",
        "body":
            "أرجو الموافقة على منحي مصدقة التخرج وعلما أني تخرجت نتيجة امتحانات الدورة الفصلية من العام الجامعي:",
        "departments": [
          {"id": 1, "name": "شعبة شؤون الطلاب"},
          {"id": 2, "name": "مكتب العميد"}
        ],
        'init_department': {"id": 6, "name": "الديوان"},
      },
      {
        "id": 2,
        "name": "براءة ذمة",
        "body":
            "يعتبر الطالب بريءالذمة تجاه لدوائر التالية : 1_المدينة الامعية 2_الفرقة الحزبية المعلوماتية 3_مكتبة كلية الهندسة المعلوماتية 4_شعبة شؤون الطلاب",
        "departments": [
          {"id": 1, "name": "شعبة شؤون الطلاب"},
          {"id": 2, "name": "مكتب العميد"},
          {"id": 3, "name": "المدينة الجامعية"},
          {"id": 4, "name": "الفرقة الحزبية المعلوماتية"},
          {"id": 5, "name": "مكتبة كلية الهندسة المعلوماتية"},
        ],
        'init_department': {"id": 6, "name": "الديوان"},
      },
      {
        "id": 3,
        "name": "طلب عام",
        "body": "أرجو الموافقة على",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
        ],
        'init_department': {"id": 6, "name": "الديوان"},
      },
      {
        "id": 4,
        "name": "طلب اعتراض على جمع العلامات",
        "body": "أرجو الموافقة على إعادة جمع علامات مقرر",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
        ],
        'init_department': {"id": 6, "name": "الديوان"},
      },
      {
        "id": 5,
        "name": "بيان وضع",
        "body": "",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
          {"id": 7, "name": "الامتحانات"},
        ],
        'init_department': {"id": 6, "name": "الديوان"},
      },
      {
        "id": 6,
        "name": "وثيقة ترفع",
        "body":
            "نجاح/ترفع الطالب من سنة الى السنة التالية وذلك بنتيجة امتحانات الدورة الفصلية وبناءعلى طلبه سمنح هذه الوثيقة",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
          {"id": 7, "name": "الامتحانات"},
        ],
        'init_department': {"id": 6, "name": "الديوان"},
      },
      {
        "id": 7,
        "name": "إشعار التخرج",
        "body":
            "يتخرج الطالب من كلية الهندسة المعلوماتية من القسم المرفق بنتيجة امتحانات الدورة الفصلية المرفقة علما أن قرار التخرج لم يصدر بعد",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
          {"id": 7, "name": "الامتحانات"},
        ],
        'init_department': {"id": 6, "name": "الديوان"},
      },
      {
        "id": 8,
        "name": "طلب إعادة العملي",
        "body":
            "السيد الدكتور عميد كلية الهندسة المعلوماتية ,أرجو الموافقة التفضل بالموافقة على إعادة العملي للمقرر المرفق ولكم جزيل الشكر",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
        ],
        'init_department': {"id": 6, "name": "الديوان"},
      },
    ]
  };
}

class FileModel {
  FileTypeEnum type;
  List<String> path;

  FileModel(this.path, this.type);
}
