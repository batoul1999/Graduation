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
  List<Departments>? departments;
  Departments? initDepartment;
  List<String>? data;

  Documents(
      {this.id,
      this.name,
      this.body,
      this.departments,
      this.initDepartment,
      this.data});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(Departments.fromJson(v));
      });
    }
    initDepartment = json['init_department'] != null
        ? Departments.fromJson(json['init_department'])
        : null;
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['body'] = body;
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
    if (initDepartment != null) {
      data['init_department'] = initDepartment!.toJson();
    }
    data['data'] = this.data;
    return data;
  }
}

class Departments {
  int? id;
  String? name;

  Departments({this.id, this.name});

  Departments.fromJson(Map<String, dynamic> json) {
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
