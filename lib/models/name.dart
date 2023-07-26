import 'package:flutter/material.dart';

class Name {
  String title = "";
  String firstName = "";
  String lastName = "";
  Name();
  Name.formJosn(Map<String, dynamic> json) {
    if (json["title"] is String || json["title"] is int) {
      title = json["title"].toString();
    }
    if (json["first"] is String || json["first"] is int) {
      firstName = json["first"].toString();
    }
    if (json["last"] is String || json["last"] is int) {
      lastName = json["last"].toString();
    }
  }
  String fullName() {
    return "$title. $firstName $lastName";
  }
}
