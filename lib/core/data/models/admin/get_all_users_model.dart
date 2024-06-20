class GetAllUsersModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? position;
  String? number;
  String? createdAt;
  String? updatedAt;

  GetAllUsersModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.position,
      this.number,
      this.createdAt,
      this.updatedAt});

  GetAllUsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    position = json['position'];
    number = json['number'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['position'] = this.position;
    data['number'] = this.number;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}