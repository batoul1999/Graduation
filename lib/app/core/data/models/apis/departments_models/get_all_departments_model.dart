class GetAllDepartmentsModel {
  bool? success;
  List<Departments>? data;

  GetAllDepartmentsModel({this.success, this.data});

  GetAllDepartmentsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Departments>[];
      json['data'].forEach((v) {
        data!.add(Departments.fromJson(v));
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

class Departments {
  int? id;
  String? name;
  String? description;

  Departments({this.id, this.name, this.description});

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}


class AllDepartments {
  int? id;
  String? name;
  String? description;
  int? pendingTasksCount;
  int? finishedTasksCount;
  int? rejectedTasksCount;
  List<Employess>? employess;

  AllDepartments(
      {this.id,
      this.name,
      this.description,
      this.pendingTasksCount,
      this.finishedTasksCount,
      this.rejectedTasksCount,
      this.employess});

  AllDepartments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pendingTasksCount = json['pending_tasks_count'];
    finishedTasksCount = json['finished_tasks_count'];
    rejectedTasksCount = json['rejected_tasks_count'];
    if (json['employess'] != null) {
      employess = <Employess>[];
      json['employess'].forEach((v) {
        employess!.add(Employess.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['pending_tasks_count'] = pendingTasksCount;
    data['finished_tasks_count'] = finishedTasksCount;
    data['rejected_tasks_count'] = rejectedTasksCount;
    if (employess != null) {
      data['employess'] = employess!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employess {
  String? name;
  int? id;

  Employess({this.name, this.id});

  Employess.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
