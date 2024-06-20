

import 'package:graduation/core/data/common_response.dart';
import 'package:graduation/core/data/enum/request_type.dart';
import 'package:graduation/core/data/models/departments_model/create_department_model.dart';
import 'package:graduation/core/data/models/departments_model/delete_department_model.dart';
import 'package:graduation/core/data/models/departments_model/get_all_departments_model.dart';
import 'package:graduation/core/data/models/departments_model/update_department_model.dart';
import 'package:graduation/core/data/network/Network_Config.dart';
import 'package:graduation/core/data/network/end_points/departments_enpoints.dart';
import 'package:graduation/core/data/util/Network_Util.dart';

class DepartmentsRepository {
  Future<(String?, CreateDepartmentModel?)> createDepartment({
    required String departmentName,
    required String departmentType,
    required String? note,
    required int employeeId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: DepartmentsEndpoints.createDepartment,
          body: {
            "name": departmentName,
            "type": departmentType,
            "note": note,
            "emp_id": employeeId,
          },
          headers: NetworkConfig.getHeaders(
            type: RequestType.POST,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, CreateDepartmentModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, UpdateDepartmentModel?)> updateDepartment({
    required int departmentId,
    required String departmentName,
    required String departmentType,
    required String note,
    required int employeeId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.PUT,
          url: DepartmentsEndpoints.updateDepartment + departmentId.toString(),
          body: {
            "name": departmentName,
            "type": departmentType,
            "note": note,
            "emp_id": employeeId,
          },
          headers: NetworkConfig.getHeaders(
            type: RequestType.PUT,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, UpdateDepartmentModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, DeleteDepartmentModel?)> deleteDepartment({
    required int departmentId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.DELETE,
          url: DepartmentsEndpoints.deleteDepartment + departmentId.toString(),
          headers: NetworkConfig.getHeaders(
            type: RequestType.DELETE,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, DeleteDepartmentModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, List<GetAllDepartmentsModel>?)> getAllDepartments() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: DepartmentsEndpoints.getAllDepartments,
          headers: NetworkConfig.getHeaders(
            type: RequestType.GET,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            List<GetAllDepartmentsModel> result = [];
            commonResponse.data!['data'].forEach(
              (element) {
                result.add(GetAllDepartmentsModel.fromJson(element));
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
}