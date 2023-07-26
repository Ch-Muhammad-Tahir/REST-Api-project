class Quote {
  String id = "";
  String quote = "";
  String author = "";

  Quote();
  Quote.fromJosn(Map<String, dynamic> json) {
    if (json["quote"] is String || json["quote"] is int) {
      quote = json["quote"].toString();
    }
    if (json["id"] is String || json["id"] is int) {
      id = json["id"].toString();
    }
    if (json["author"] is String || json["author"] is int) {
      author = json["author"].toString();
    }
  }
}
