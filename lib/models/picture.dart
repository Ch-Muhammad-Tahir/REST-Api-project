class UserPicture {
  String largePicure = "";
  String mediumPicure = "";
  String thumbnail = "";
  UserPicture();
  UserPicture.fromJson(Map<String, dynamic> json) {
    if (json["large"] != null) {
      if (json["large"] is String) {
        largePicure = json["large"].toString();
      }
    }
    if (json["medium"] != null) {
      if (json["medium"] is String) {
        mediumPicure = json["medium"].toString();
      }
    }
    if (json["thumbnail"] != null) {
      if (json["thumbnail"] is String) {
        thumbnail = json["thumbnail"].toString();
      }
    }
  }
}
