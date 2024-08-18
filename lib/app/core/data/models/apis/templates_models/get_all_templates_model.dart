class GetAllTemplatesModel {
  bool? success;
  List<Templates>? data;

  GetAllTemplatesModel({this.success, this.data});

  GetAllTemplatesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Templates>[];
      json['data'].forEach((v) {
        data!.add(Templates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Templates {
  int? id;
  String? name;
  List<String>? list;
  List<String>? requiredDepartment;

  Templates({this.id, this.name, this.list, this.requiredDepartment});

  Templates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    list = json['list'].cast<String>();
    requiredDepartment = json['requiredDepartment'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['list'] = list;
    data['requiredDepartment'] = requiredDepartment;
    return data;
  }
}
