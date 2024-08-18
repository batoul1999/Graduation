class GetAllTaskModel {
  bool? success;
  List<Task>? data;

  GetAllTaskModel({this.success, this.data});

  GetAllTaskModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Task>[];
      json['data'].forEach((v) {
        data!.add(Task.fromJson(v));
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

class Task {
  String? states;
  Post? post;
  int? depart;
  int? id;

  Task({this.states, this.post, this.depart, this.id});

  Task.fromJson(Map<String, dynamic> json) {
    states = json['states'];
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
    depart = json['depart'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['states'] = states;
    if (post != null) {
      data['post'] = post!.toJson();
    }
    data['depart'] = depart;
    data['id'] = id;
    return data;
  }
}

class Post {
  Template? template;

  Post({this.template});

  Post.fromJson(Map<String, dynamic> json) {
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
  String? name;

  Template({this.name});

  Template.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
