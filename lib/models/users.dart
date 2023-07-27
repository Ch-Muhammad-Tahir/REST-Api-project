import 'package:first_api_project/models/date_of_birth.dart';
import 'package:first_api_project/models/picture.dart';

import '../models/name.dart';

class Users {
  Name name = Name();
  String gender = "";
  String email = "";
  UserPicture picutre = UserPicture();
  DateOfBith dateOfBith = DateOfBith();

  Users();
  Users.formJson(Map<String, dynamic> json) {
    if (json["gender"] is String || json["gender"] is int) {
      gender = json["gender"].toString();
    }
    if (json["email"] is String || json["email"] is int) {
      email = json["email"].toString();
    }
    if (json["name"] is Map) {
      name = Name.formJosn(json["name"]);
    }
    if (json["picture"] is Map) {
      picutre = UserPicture.fromJson(json["picture"]);
    }
    if (json["dob"] is Map) {
      dateOfBith = DateOfBith.fromJson(json["dob"]);
    }
  }
}
