class GetAllDocsModel {
  List<Documents>? documents;

  GetAllDocsModel({this.documents});

  GetAllDocsModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  int? id;
  String? name;
  String? description;
  String? type;
  String? issuedBy;
  String? issuedDate;

  Documents(
      {this.id,
      this.name,
      this.description,
      this.type,
      this.issuedBy,
      this.issuedDate});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    issuedBy = json['issuedBy'];
    issuedDate = json['issuedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['issuedBy'] = issuedBy;
    data['issuedDate'] = issuedDate;
    return data;
  }
}