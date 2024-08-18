import 'package:graduation/app/core/data/network/network_config.dart';

class AuthEndpoints {
  static String login = NetworkConfig.getFulApiUrl('/user/login');
  static String editInfo = NetworkConfig.getFulApiUrl('/user/');
}
