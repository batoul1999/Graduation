class GetAllTasksModel {
  List<Tasks>? tasks;

  GetAllTasksModel({this.tasks});

  GetAllTasksModel.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tasks != null) {
      data['tasks'] = tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks {
  int? id;
  String? name;
  String? description;
  String? issuedDate;
  String? status;
  String? currentDepartment;
  String? currentEmployee;
  List<PreviousDepartments>? previousDepartments;
  List<NextDepartments>? nextDepartments;

  Tasks(
      {this.id,
      this.name,
      this.description,
      this.issuedDate,
      this.status,
      this.currentDepartment,
      this.currentEmployee,
      this.previousDepartments,
      this.nextDepartments});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    issuedDate = json['issuedDate'];
    status = json['status'];
    currentDepartment = json['current_department'];
    currentEmployee = json['current_employee'];
    if (json['previous_departments'] != null) {
      previousDepartments = <PreviousDepartments>[];
      json['previous_departments'].forEach((v) {
        previousDepartments!.add(PreviousDepartments.fromJson(v));
      });
    }
    if (json['next_departments'] != null) {
      nextDepartments = <NextDepartments>[];
      json['next_departments'].forEach((v) {
        nextDepartments!.add(NextDepartments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['issuedDate'] = issuedDate;
    data['status'] = status;
    data['current_department'] = currentDepartment;
    data['current_employee'] = currentEmployee;
    if (previousDepartments != null) {
      data['previous_departments'] =
          previousDepartments!.map((v) => v.toJson()).toList();
    }
    if (nextDepartments != null) {
      data['next_departments'] =
          nextDepartments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreviousDepartments {
  String? name;
  int? id;

  PreviousDepartments({this.name, this.id});

  PreviousDepartments.fromJson(Map<String, dynamic> json) {
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

class NextDepartments {
  String? name;
  int? id;

  NextDepartments({this.name, this.id});

  NextDepartments.fromJson(Map<String, dynamic> json) {
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
