import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_docs_model/get_all_docs_model.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class DocumentDetailsController extends BaseController
    with GetTickerProviderStateMixin {
  Documents? document;
  AnimationController? animationController;
  TextEditingController employeeController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController studentController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  RxList<String> imageList = <String>[].obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      document = Get.arguments['document'];
    }
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )
      ..forward()
      ..repeat(reverse: true);
    super.onInit();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  void fakeSending() {
    runFullLoadingFutureFunction(
        function: Future.delayed(const Duration(seconds: 3)).then((value) {
      CustomToast.showMessage(
          message: 'تمت الإضافة بنجاح', messagetype: MessageType.success);
    }));
  }
}
