import 'package:graduation/core/data/common_response.dart';
import 'package:graduation/core/data/enum/request_type.dart';
import 'package:graduation/core/data/models/admin/create_user_model.dart';
import 'package:graduation/core/data/models/admin/delete_user_model.dart';
import 'package:graduation/core/data/models/admin/get_all_users_model.dart';
import 'package:graduation/core/data/network/end_points/users_end_points.dart';
import 'package:graduation/core/data/network/network_config.dart';
import 'package:graduation/core/data/util/network_util.dart';

class UsersRepository{
  Future<(String?, List<GetAllUsersModel>?)> getAllUsers (
  
  ) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url:UsersEndPoints.getAllUsers,
             
              headers: NetworkConfig.getHeaders(
                  type: RequestType.POST,
                  needAuth: false,
              ))
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
             List<GetAllUsersModel> result = [];
            commonResponse.data!['data'].forEach(
              (element) {
                result.add(GetAllUsersModel.fromJson(element));
              },
            );
            return (null, result);
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }
   Future<(String?, DeleteUserModel?)> deleteUser (
  {
    required int userId
  
  }
  ) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.DELETE,
              url:UsersEndPoints.deleteUser+userId.toString(),
             
              // headers: NetworkConfig.getHeaders(
              //     type: RequestType.POST,
              //     needAuth: false,
              // )
              )
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
          
            return (null, DeleteUserModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?,CreateUserModel?)> createUser (
  {required String userName,
  required String department,
  required String phoneNumber }
  ) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.POST,
              url:UsersEndPoints.createUser,
              body: {
                'name':userName,
                'position':department,
                'number':phoneNumber
              },
              headers: NetworkConfig.getHeaders(
                  type: RequestType.POST,
                  needAuth: false,
              ))
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            
           return (null, CreateUserModel.fromJson(commonResponse.data!));
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