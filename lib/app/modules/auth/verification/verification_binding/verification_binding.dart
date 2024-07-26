import 'package:get/get.dart';
import 'package:graduation/app/modules/auth/verification/verification_controller/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(
      () => VerificationController(),
    );
  }
}
