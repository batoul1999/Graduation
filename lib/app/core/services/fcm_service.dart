import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/utils.dart';
import 'package:graduation/app/core/data/models/notification_model.dart';
import 'package:graduation/app/core/enums/application_state.dart';
import 'package:graduation/app/core/enums/notification_type.dart';
import 'package:graduation/app/core/utils/general_utils.dart';

class FcmService {
  StreamController<NotificationModel> notificationStream =
      StreamController.broadcast();

  FcmService() {
    onInit();
  }

  void onInit() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      log(fcmToken.toString());

      //!--- Here to call api ----

      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        // Note: This callback is fired at each app startup and whenever a new
        // token is generated.
        //!--- Here to call api ----
      }).onError((err) {
        // Error getting token.
      });

      if (GetPlatform.isIOS) {
        FirebaseMessaging messaging = FirebaseMessaging.instance;

        NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          provisional: true,
          sound: true,
          badge: true,
          carPlay: false,
          criticalAlert: false,
        );

        // if (settings.authorizationStatus == AuthorizationStatus.denied) {

        // }
      }

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        NotificationModel model = NotificationModel.fromJson(message.data);
        handelNotification(
            model: model, applicationState: ApplicationState.forground);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        NotificationModel model = NotificationModel.fromJson(message.data);
        handelNotification(
            model: model, applicationState: ApplicationState.background);
      });
    } catch (e) {
      log(e.toString(), name: 'FCM service');
    }
  }

  void handelNotification(
      {required NotificationModel model,
      required ApplicationState applicationState}) {
    notificationStream.add(model);
    if (model.notificatioNType == NotificationType.subscribtion.name) {
      prefStorage.setSubStatus(model.model == '1' ? true : false);
    }
  }
}
