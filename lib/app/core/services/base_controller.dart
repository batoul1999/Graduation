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
  final TextEditingController nameController =
      TextEditingController(text: 'batoul');
  final TextEditingController passwordController =
      TextEditingController(text: 'Test@1234');
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
        "name": "Military Document",
        "description":
            "This document is used for proving your military status.",
        "type": "Government Issued",
        "issuedBy": "Ministry of Defense",
        "issuedDate": "2023-08-15"
      },
      {
        "id": 2,
        "name": "University Transcript",
        "description":
            "This document outlines your academic record, including grades and courses completed.",
        "type": "Academic",
        "issuedBy": "University of XYZ",
        "issuedDate": "2023-06-20"
      },
      {
        "id": 3,
        "name": "Passport",
        "description":
            "A travel document issued by a government, used for identification and travel.",
        "type": "Government Issued",
        "issuedBy": "Department of Immigration",
        "issuedDate": "2022-05-10"
      },
      {
        "id": 4,
        "name": "Driver's License",
        "description":
            "A document proving your eligibility to drive a motor vehicle.",
        "type": "Government Issued",
        "issuedBy": "Department of Motor Vehicles",
        "issuedDate": "2021-12-01"
      },
      {
        "id": 5,
        "name": "Birth Certificate",
        "description":
            "A legal document that proves the date and place of an individual's birth.",
        "type": "Government Issued",
        "issuedBy": "Department of Vital Records",
        "issuedDate": "1995-07-25"
      },
      {
        "id": 6,
        "name": "Marriage Certificate",
        "description":
            "A legal document certifying the marriage of two individuals.",
        "type": "Government Issued",
        "issuedBy": "Civil Registry Office",
        "issuedDate": "2020-09-12"
      },
      {
        "id": 7,
        "name": "Insurance Policy",
        "description":
            "A contract outlining the terms of an insurance agreement.",
        "type": "Contract",
        "issuedBy": "ABC Insurance Company",
        "issuedDate": "2023-01-05"
      },
      {
        "id": 8,
        "name": "Medical Records",
        "description":
            "A collection of documents containing medical history and treatment information.",
        "type": "Medical",
        "issuedBy": "XYZ Hospital",
        "issuedDate": "2023-04-18"
      },
      {
        "id": 9,
        "name": "Bank Statement",
        "description":
            "A document summarizing financial transactions within a specific period.",
        "type": "Financial",
        "issuedBy": "First National Bank",
        "issuedDate": "2023-07-31"
      },
      {
        "id": 10,
        "name": "Tax Return",
        "description":
            "A document filed with a tax authority, declaring income and taxes owed.",
        "type": "Financial",
        "issuedBy": "Internal Revenue Service",
        "issuedDate": "2023-04-15"
      },
      {
        "id": 11,
        "name": "Lease Agreement",
        "description":
            "A contract outlining the terms of a property rental agreement.",
        "type": "Contract",
        "issuedBy": "Landlord",
        "issuedDate": "2022-08-01"
      },
      {
        "id": 12,
        "name": "Employment Contract",
        "description":
            "A contract outlining the terms of employment between an employer and employee.",
        "type": "Contract",
        "issuedBy": "Company",
        "issuedDate": "2023-03-15"
      },
      {
        "id": 13,
        "name": "Loan Agreement",
        "description":
            "A contract outlining the terms of a loan agreement between a lender and borrower.",
        "type": "Financial",
        "issuedBy": "Bank",
        "issuedDate": "2023-02-28"
      },
      {
        "id": 14,
        "name": "Bill of Sale",
        "description":
            "A document transferring ownership of goods or property from seller to buyer.",
        "type": "Legal",
        "issuedBy": "Seller",
        "issuedDate": "2023-05-05"
      },
      {
        "id": 15,
        "name": "Will",
        "description":
            "A legal document outlining the distribution of assets after death.",
        "type": "Legal",
        "issuedBy": "Individual",
        "issuedDate": "2022-11-10"
      },
      {
        "id": 16,
        "name": "Power of Attorney",
        "description":
            "A legal document authorizing someone to act on another person's behalf.",
        "type": "Legal",
        "issuedBy": "Individual",
        "issuedDate": "2023-06-12"
      },
      {
        "id": 17,
        "name": "Certificate of Incorporation",
        "description": "A legal document establishing a corporation.",
        "type": "Legal",
        "issuedBy": "Government Registry",
        "issuedDate": "2022-09-22"
      },
      {
        "id": 18,
        "name": "Contract for Services",
        "description":
            "A contract outlining the terms of service provision between parties.",
        "type": "Contract",
        "issuedBy": "Client",
        "issuedDate": "2023-07-01"
      },
      {
        "id": 19,
        "name": "Warranty",
        "description":
            "A document guaranteeing the quality or performance of a product.",
        "type": "Contract",
        "issuedBy": "Manufacturer",
        "issuedDate": "2023-08-01"
      }
    ]
  };
}

class FileModel {
  FileTypeEnum type;
  List<String> path;

  FileModel(this.path, this.type);
}
