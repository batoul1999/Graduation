class GetTaskByIdModel {
  Postat? postat;
  Required? required;
  List<Statefordept>? statefordept;

  GetTaskByIdModel({this.postat, this.required, this.statefordept});

  GetTaskByIdModel.fromJson(Map<String, dynamic> json) {
    postat =
        json['postat'] != null ? Postat.fromJson(json['postat']) : null;
    required = json['required'] != null
        ? Required.fromJson(json['required'])
        : null;
    if (json['statefordept'] != null) {
      statefordept = <Statefordept>[];
      json['statefordept'].forEach((v) {
        statefordept!.add(Statefordept.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (postat != null) {
      data['postat'] = postat!.toJson();
    }
    if (required != null) {
      data['required'] = required!.toJson();
    }
    if (statefordept != null) {
      data['statefordept'] = statefordept!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Postat {
  int? id;
  String? description;
  String? image;
  String? date;
  int? depart;
  String? createdAt;
  String? updatedAt;
  int? number;
  String? stuname;
  String? year;
  String? toYear;
  String? examsyear;
  String? course;
  String? studepart;
  int? collID;
  String? subject;
  String? semester;
  int? tempid;

  Postat(
      {this.id,
      this.description,
      this.image,
      this.date,
      this.depart,
      this.createdAt,
      this.updatedAt,
      this.number,
      this.stuname,
      this.year,
      this.toYear,
      this.examsyear,
      this.course,
      this.studepart,
      this.collID,
      this.subject,
      this.semester,
      this.tempid});

  Postat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    image = json['image'];
    date = json['date'];
    depart = json['depart'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    number = json['number'];
    stuname = json['stuname'];
    year = json['year'];
    toYear = json['to_year'];
    examsyear = json['examsyear'];
    course = json['course'];
    studepart = json['studepart'];
    collID = json['collID'];
    subject = json['subject'];
    semester = json['semester'];
    tempid = json['tempid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['image'] = image;
    data['date'] = date;
    data['depart'] = depart;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['number'] = number;
    data['stuname'] = stuname;
    data['year'] = year;
    data['to_year'] = toYear;
    data['examsyear'] = examsyear;
    data['course'] = course;
    data['studepart'] = studepart;
    data['collID'] = collID;
    data['subject'] = subject;
    data['semester'] = semester;
    data['tempid'] = tempid;
    return data;
  }
}

class Required {
  Template? template;

  Required({this.template});

  Required.fromJson(Map<String, dynamic> json) {
    template = json['template'] != null
        ? Template.fromJson(json['template'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (template != null) {
      data['template'] = template!.toJson();
    }
    return data;
  }
}

class Template {
  List<String>? requiredDepartment;
  String? name;

  Template({this.requiredDepartment, this.name});

  Template.fromJson(Map<String, dynamic> json) {
    requiredDepartment = json['requiredDepartment'].cast<String>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requiredDepartment'] = requiredDepartment;
    data['name'] = name;
    return data;
  }
}

class Statefordept {
  String? states;
  Department? department;

  Statefordept({this.states, this.department});

  Statefordept.fromJson(Map<String, dynamic> json) {
    states = json['states'];
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['states'] = states;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    return data;
  }
}

class Department {
  String? name;

  Department({this.name});

  Department.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
