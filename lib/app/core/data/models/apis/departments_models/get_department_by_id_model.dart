class GetDepartmentByIdModel {
  Depart? depart;
  Accepted? accepted;
  Accepted? inProgress;
  Accepted? rejected;
  List<DepInfoUser>? depInfoUser;

  GetDepartmentByIdModel(
      {this.depart,
      this.accepted,
      this.inProgress,
      this.rejected,
      this.depInfoUser});

  GetDepartmentByIdModel.fromJson(Map<String, dynamic> json) {
    depart =
        json['depart'] != null ? Depart.fromJson(json['depart']) : null;
    accepted = json['accepted'] != null
        ? Accepted.fromJson(json['accepted'])
        : null;
    inProgress = json['in_progress'] != null
        ? Accepted.fromJson(json['in_progress'])
        : null;
    rejected = json['rejected'] != null
        ? Accepted.fromJson(json['rejected'])
        : null;
    if (json['depInfoUser'] != null) {
      depInfoUser = <DepInfoUser>[];
      json['depInfoUser'].forEach((v) {
        depInfoUser!.add(DepInfoUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (depart != null) {
      data['depart'] = depart!.toJson();
    }
    if (accepted != null) {
      data['accepted'] = accepted!.toJson();
    }
    if (inProgress != null) {
      data['in_progress'] = inProgress!.toJson();
    }
    if (rejected != null) {
      data['rejected'] = rejected!.toJson();
    }
    if (depInfoUser != null) {
      data['depInfoUser'] = depInfoUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Depart {
  int? id;
  String? name;
  String? description;

  Depart({this.id, this.name, this.description});

  Depart.fromJson(Map<String, dynamic> json) {
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

class Accepted {
  Count? cCount;

  Accepted({this.cCount});

  Accepted.fromJson(Map<String, dynamic> json) {
    cCount = json['_count'] != null ? Count.fromJson(json['_count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cCount != null) {
      data['_count'] = cCount!.toJson();
    }
    return data;
  }
}

class Count {
  int? relationDep;

  Count({this.relationDep});

  Count.fromJson(Map<String, dynamic> json) {
    relationDep = json['relationDep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['relationDep'] = relationDep;
    return data;
  }
}

class DepInfoUser {
  int? id;
  String? userName;
  String? email;
  String? name;
  String? password;
  String? position;
  String? sex;
  String? number;
  int? depart;
  String? token;
  String? createdAt;
  String? updatedAt;

  DepInfoUser(
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

  DepInfoUser.fromJson(Map<String, dynamic> json) {
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
