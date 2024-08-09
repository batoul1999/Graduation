class GetAllDepartmentsModel {
  List<AllDepartments>? departments;

  GetAllDepartmentsModel({this.departments});

  GetAllDepartmentsModel.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <AllDepartments>[];
      json['departments'].forEach((v) {
        departments!.add(AllDepartments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
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
