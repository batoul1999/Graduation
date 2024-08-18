class LoginModel {
  bool? success;
  String? message;
  String? token;
  String? name;
  String? email;
  int? id;

  LoginModel({this.success, this.message, this.token,this.id});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    name = json['user_name'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['token'] = token;
    data['user_name'] = name;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
