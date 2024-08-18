class GetAllEmployeesModel {
  bool? success;
  List<Employees>? data;

  GetAllEmployeesModel({this.success, this.data});

  GetAllEmployeesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Employees>[];
      json['data'].forEach((v) {
        data!.add(Employees.fromJson(v));
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

class Employees {
  int? id;
  String? userName;
  String? email;
  String? name;
  String? password;
  String? position;
  String? sex;
  int? number;
  int? depart;
  String? token;
  String? createdAt;
  String? updatedAt;

  Employees(
      {this.id,
      this.userName,
      this.email,
      this.name,
      this.password,
      this.position,
      this.sex,
      this.number,
      this.depart,
      this.token,
      this.createdAt,
      this.updatedAt});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    position = json['position'];
    sex = json['sex'];
    number = json['number'];
    depart = json['depart'];
    token = json['token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    data['position'] = position;
    data['sex'] = sex;
    data['number'] = number;
    data['depart'] = depart;
    data['token'] = token;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
