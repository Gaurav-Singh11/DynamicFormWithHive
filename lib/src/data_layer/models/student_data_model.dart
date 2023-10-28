class StudentDataModel {
  StudentDataModel({
    this.id,
    this.name,
    this.email,
    this.gender,
  });

  StudentDataModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
  }

  String? id;
  String? name;
  String? email;
  String? gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['gender'] = gender;
    return map;
  }
}
