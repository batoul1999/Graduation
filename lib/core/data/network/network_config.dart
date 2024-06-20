import 'package:graduation/core/data/enum/request_type.dart';
import 'package:graduation/core/util.dart';


class NetworkConfig {
  static String BASE_API = '/apps/';
  static String getFulApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth == true)
        'Authorization': 'Bearer ${localStorage.getTokenInfo}',
      if (type != RequestType.GET) 'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}