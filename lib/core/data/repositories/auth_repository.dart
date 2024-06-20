import 'package:graduation/core/data/common_response.dart';
import 'package:graduation/core/data/enum/request_type.dart';
import 'package:graduation/core/data/models/auth_model/login_model.dart';
import 'package:graduation/core/data/network/end_points/auth_endpoints.dart';
import 'package:graduation/core/data/network/network_config.dart';
import 'package:graduation/core/data/util/Network_Util.dart';

class AuthRepository{
  Future<(String?, LoginModel?)> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.POST,
              url: AuthEndpoints.login,
              body: {
                "email": email,
                "password": password,
              },
              headers: NetworkConfig.getHeaders(               
                  needAuth: false
                 ))
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, LoginModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }
  
}