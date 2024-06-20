class GetAllDepartmentsModel implements ItemKey {
  int? id;
  String? name;
  String? type;
  String? note;
  int? empId;
  int? createdBy;
  String? createdAt;
  String? manager;
  @override
  String get nameDrop => name!;
  GetAllDepartmentsModel({
    this.id,
    this.name,
    this.type,
    this.note,
    this.empId,
    this.createdBy,
    this.createdAt,
    this.manager,
  });

  GetAllDepartmentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    note = json['note'];
    empId = json['emp_id'];
    createdBy = json['created_by'];
    createdAt = json['createdAt'];
    manager = json['manager'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['note'] = this.note;
    data['emp_id'] = this.empId;
    data['created_by'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['manager'] = this.manager;

    return data;
  }
}
abstract class ItemKey {
  String get nameDrop;
}
