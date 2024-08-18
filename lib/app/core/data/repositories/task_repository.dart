import 'package:graduation/app/core/data/models/apis/task_models/create_task_model.dart';
import 'package:graduation/app/core/data/models/apis/task_models/get_all_tasks_model.dart';
import 'package:graduation/app/core/data/models/apis/task_models/get_task_by_id.dart';
import 'package:graduation/app/core/data/models/common_response.dart';
import 'package:graduation/app/core/data/network/end_points/task_endpoints.dart';
import 'package:graduation/app/core/data/network/network_config.dart';
import 'package:graduation/app/core/enums/request_type.dart';
import 'package:graduation/app/core/utils/network_utils.dart';

class TaskRepository {
  Future<(String?, GetAllTaskModel?)> getAllTasks() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.get,
              url: TaskEndpoints.getAll,
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.get))
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, GetAllTaskModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, GetTaskByIdModel?)> getTaskById({required int id}) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.get,
              url: TaskEndpoints.getById + id.toString(),
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.get))
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, GetTaskByIdModel.fromJson(commonResponse.data!));
          }
        } else {
          return ('تحقق من اتصالك بالأنترنت', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, CreateTaskModel?)> create(
      {required List<String> image, required CreateTaskRequest model}) async {
    Map<String, String> fields = {};
    model.toJson().forEach((key, value) {
      fields[key] = value.toString();
    });
    try {
      return NetworkUtil.sendMultipartRequest(
              type: RequestType.post,
              url: TaskEndpoints.create,
              fields: fields,
              files: {"image": image},
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.post))
          .then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (commonResponse.message ?? '', null);
          } else {
            return (null, CreateTaskModel.fromJson(commonResponse.data!));
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

class CreateTaskRequest {
  int? type;
  int? sender;
  int? receiver;
  int? number;
  String? date;
  String? description;
  String? studentName;
  String? year;
  String? toYear;
  String? examsYear;
  String? course;
  String? studentDepart;
  String? subject;
  String? semester;
  int? collID;

  CreateTaskRequest(
      { this.type,
       this.sender,
       this.receiver,
       this.number,
       this.date,
       this.description,
       this.studentName,
       this.year,
       this.toYear,
       this.examsYear,
       this.collID,
       this.course,
       this.semester,
       this.studentDepart,
       this.subject});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['number'] = number;
    data['date'] = date;
    data['description'] = description;
    data['stuname'] = studentName;
    data['year'] = year;
    data['to_year'] = toYear;
    data['examsyear'] = examsYear;
    data['course'] = course;
    data['studepart'] = studentDepart;
    data['collID'] = collID;
    data['subject'] = subject;
    data['semester'] = semester;
    return data;
  }
}
