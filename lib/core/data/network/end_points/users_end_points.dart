import 'package:graduation/core/data/network/network_config.dart';

class UsersEndPoints {
  static String getAllUsers = NetworkConfig.getFulApiUrl("/user");
  static String deleteUser = NetworkConfig.getFulApiUrl("/user/");
  static String createUser = NetworkConfig.getFulApiUrl("/user/");
}