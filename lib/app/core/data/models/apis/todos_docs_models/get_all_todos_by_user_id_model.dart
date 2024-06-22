import 'package:graduation/app/core/data/models/apis/todos_docs_models/get_all_todos_model.dart';

class GetAllTodosByUserIdModel {
  List<Todos>? todos;
  int? total;
  int? skip;
  int? limit;

  GetAllTodosByUserIdModel({this.todos, this.total, this.skip, this.limit});

  GetAllTodosByUserIdModel.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = <Todos>[];
      json['todos'].forEach((v) {
        todos!.add(Todos.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (todos != null) {
      data['todos'] = todos!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}
