import 'package:graduation/app/core/data/models/apis/auth_models/edit_ifo_model.dart';
import 'package:graduation/app/core/data/models/apis/auth_models/login_model.dart';
import 'package:graduation/app/core/data/models/common_response.dart';
import 'package:graduation/app/core/data/network/end_points/auth_endpoints.dart';
import 'package:graduation/app/core/data/network/network_config.dart';
import 'package:graduation/app/core/enums/request_type.dart';
import 'package:graduation/app/core/utils/network_utils.dart';

class AuthRepository {
  Future<(String?, LoginModel?)> login({
    required String userName,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.post,
              url: AuthEndpoints.login,
              body: {
                "user_name": userName,
                "password": password,
              },
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.post))
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

  Future<(String?, EditInfoModel?)> editInfo(
      {required int id,
      required String userName,
      required String email,
      required String password}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.put,
          url: AuthEndpoints.editInfo + id.toString(),
          body: {"name": userName, "password": password, "email": email},
          headers: NetworkConfig.getHeaders(
            type: RequestType.put,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              EditInfoModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }
}
