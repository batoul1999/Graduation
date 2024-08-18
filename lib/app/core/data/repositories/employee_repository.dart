import 'package:graduation/app/core/data/models/apis/employess_models/create_employee_model/create_employee_model.dart';
import 'package:graduation/app/core/data/models/apis/employess_models/get_all_employees_model/get_all_employees_model.dart';
import 'package:graduation/app/core/data/models/common_response.dart';
import 'package:graduation/app/core/data/network/end_points/employee_endpoints.dart';
import 'package:graduation/app/core/data/network/network_config.dart';
import 'package:graduation/app/core/enums/request_type.dart';
import 'package:graduation/app/core/utils/network_utils.dart';

class EmployeeRepository {
  Future<(String?, CreateEmployeeModel?)> createEmployee(
      {required String userName,required String password,required int departmentId}) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.post,
              url: EmployeeEndpoints.create,
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.post),
              body: {
                "user_name":userName,
                "password":password,
                "depart":departmentId
              })
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, CreateEmployeeModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }
    Future<(String?, GetAllEmployeesModel?)> getAll(
 ) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.get,
              url: EmployeeEndpoints.getAll,
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.get),)
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, GetAllEmployeesModel.fromJson(commonResponse.data!));
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


