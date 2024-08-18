import 'package:graduation/app/core/data/models/apis/departments_models/craete_department_model.dart';
import 'package:graduation/app/core/data/models/apis/departments_models/get_all_departments_model.dart';
import 'package:graduation/app/core/data/models/apis/departments_models/get_department_by_id_model.dart';
import 'package:graduation/app/core/data/models/common_response.dart';
import 'package:graduation/app/core/data/network/end_points/department_endpoints.dart';
import 'package:graduation/app/core/data/network/network_config.dart';
import 'package:graduation/app/core/enums/request_type.dart';
import 'package:graduation/app/core/utils/network_utils.dart';

class DepartmentsRepository {
  Future<(String?, GetAllDepartmentsModel?)> getDepartments() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.get,
              url: DepartmentEndpoints.getAll,
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.get))
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (
              null,
              GetAllDepartmentsModel.fromJson(commonResponse.data!)
            );
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, CraeteDepartmentModel?)> createDepartment(
      {required String name, required String description}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.post,
          url: DepartmentEndpoints.create,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.post),
          body: {
            "name": name,
            "description": description,
          }).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, CraeteDepartmentModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }
  Future<(String?, GetDepartmentByIdModel?)> getDepartmentById(
      {required int id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.get,
          url: DepartmentEndpoints.getDepartmentById + id.toString(),
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.get),
          ).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, GetDepartmentByIdModel.fromJson(commonResponse.data!));
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
