import 'package:graduation/app/core/data/models/apis/templates_models/add_new_template_model.dart';
import 'package:graduation/app/core/data/models/apis/templates_models/get_all_templates_model.dart';
import 'package:graduation/app/core/data/models/common_response.dart';
import 'package:graduation/app/core/data/network/end_points/templates_endpoints.dart';
import 'package:graduation/app/core/data/network/network_config.dart';
import 'package:graduation/app/core/enums/request_type.dart';
import 'package:graduation/app/core/utils/network_utils.dart';

class TemplatesRepository {
  Future<(String?, AddNewTemplateModel?)> create(
      {required String plainText,
      required List<String> dataList,
      required List<String> departmentsList}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.post,
          url: TemplatesEndpoints.addNew,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.post),
          body: {
            "name": plainText,
            "requiredDepartment": departmentsList,
            "list": dataList
          }).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, AddNewTemplateModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, GetAllTemplatesModel?)> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.get,
        url: TemplatesEndpoints.getAll,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.get),
      ).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, GetAllTemplatesModel.fromJson(commonResponse.data!));
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
