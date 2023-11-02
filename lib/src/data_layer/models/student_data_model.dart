class StudentDataModel {
  StudentDataModel({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.createdAt,
    this.updatedAt,
  });

  StudentDataModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  String? id;
  String? name;
  String? email;
  String? gender;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['gender'] = gender;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
