class LoginModel {
  bool? success;
  String? message;
  String? token;

  LoginModel({this.success, this.message, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['success'] = success;
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}
