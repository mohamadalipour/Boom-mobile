import 'package:boom/model/base_model.dart';

class Character  implements JsonParser{
  String sId;
  String name;
  String role;
  String house;
  String school;


  Character(
      {this.sId,
        this.name,
        this.role,
        this.house,
        this.school,
    });


  @override
  Character fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    role = json['role'];
    house = json['house'];
    school = json['school'];
    return Character(sId: sId,name: name,house: house,role: role,school: school);
  }
}