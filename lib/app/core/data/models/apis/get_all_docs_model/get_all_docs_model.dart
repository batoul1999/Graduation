class GetAllDocsModel {
  List<Documents>? documents;

  GetAllDocsModel({this.documents});

  GetAllDocsModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  int? id;
  String? name;
  String? body;
  List<Department>? departments;
  Department? initDepartment;

  Documents({this.id, this.name, this.departments, this.initDepartment});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    if (json['departments'] != null) {
      departments = <Department>[];
      json['departments'].forEach((v) {
        departments!.add(Department.fromJson(v));
      });
    }
    initDepartment = Department.fromJson(json['init_department']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['body'] = body;
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
    data['init_department'] = initDepartment;
    return data;
  }
}

class Department {
  int? id;
  String? name;
  Department({this.id, this.name});
  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
