import 'dart:convert';
import 'package:graduation/core/data/models/auth_model/login_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';


class HiveRepository {
  static String HIVE_FIRST_RUN = "first_launch";
  static String HIVE_FIRST_LOGIN = "first_login";
  static String HIVE_LOGIN_MODEL = 'login_model';
  static String HIVE_TOKEN_INFO = 'token_info';
  static String Hive_USER_INFO = 'user_info';
  static String HIVE_GENERAL_BOX = "app_general_info";

  //initilaize Hive and open Big general box to access it in main method
  Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    await Hive.openBox(HIVE_GENERAL_BOX);
  }

  //Store First application launch
  Future<void> setFirstLaunch(bool value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(HIVE_FIRST_RUN, value);
  }

  bool get grtFirstLaunch =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_FIRST_RUN, defaultValue: false);

  // Store First login to prevent multi login after closing app
  Future<void> setFirstLogin(bool value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(HIVE_FIRST_LOGIN, value);
  }

  bool get getFirstLogin =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_FIRST_LOGIN, defaultValue: false);

  //Store LoginModel for all project
  Future<void> setLoginModel(LoginModel value) async {
    await Hive.box(HIVE_GENERAL_BOX)
        .put(HIVE_LOGIN_MODEL, jsonEncode(value.toJson()));
  }

  LoginModel? get getLoginModel {
    if (Hive.box(HIVE_GENERAL_BOX).containsKey(HIVE_LOGIN_MODEL)) {
      return LoginModel.fromJson(jsonDecode(Hive.box(HIVE_GENERAL_BOX)
          .get(HIVE_LOGIN_MODEL, defaultValue: false)));
    } else {
      return null;
    }
  }

  // Store List of user info to access data in profile view
  Future<void> setUserInfoModel(List<String> value) async {
    Hive.box(HIVE_GENERAL_BOX).put(Hive_USER_INFO, value);
  }

  List<String?>? get getUserInfoModel {
    if (Hive.box(HIVE_GENERAL_BOX).containsKey(Hive_USER_INFO)) {
      return Hive.box(HIVE_GENERAL_BOX)
          .get(Hive_USER_INFO, defaultValue: false);
    } else {
      return null;
    }
  }

  //Store token and get it
  Future<void> setTokenInfo(String value) async {
    Hive.box(HIVE_GENERAL_BOX).put(HIVE_TOKEN_INFO, value);
  }

  String get getTokenInfo =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_TOKEN_INFO, defaultValue: false);
}