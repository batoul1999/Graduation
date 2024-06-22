import 'package:graduation/app/core/enums/request_type.dart';
import 'package:graduation/app/core/utils/general_utils.dart';

class NetworkConfig {
  static String baseApi = '';
  static String getFulApiUrl(String api) {
    return baseApi + api;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      RequestType? type = RequestType.post,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth == true)
        'Authorization': 'Bearer ${prefStorage.getTokenInfo()}',
      if (type != RequestType.get && type != RequestType.delete)
        'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}
