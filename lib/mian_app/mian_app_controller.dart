import 'package:graduation/app/core/enums/notification_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class MainAppController extends BaseController {
  @override
  void onInit() {
    fcmService.notificationStream.stream.listen((event) {
      if (event.notificatioNType == NotificationType.changeColor.name) {
        CustomToast.showMessage(message: 'Recieve firebase notificatio');
      }
    });
    super.onInit();
  }
}

