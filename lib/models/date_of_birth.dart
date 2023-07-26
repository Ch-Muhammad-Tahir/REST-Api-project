class DateOfBith {
  String date = "";
  String age = "";
  DateOfBith();
  DateOfBith.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String || json["date"] is int) {
      date = json["date"].toString();
    }
    if (json["age"] is String || json["age"] is int) {
      age = json["age"].toString();
    }
  }
}
