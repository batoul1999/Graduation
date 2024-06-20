class CreateDepartmentModel {
  bool? success;
  Data? data;

  CreateDepartmentModel({this.success, this.data});

  CreateDepartmentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? msg;

  Data({this.id, this.msg});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['msg'] = this.msg;
    return data;
  }
}
