class Product {
  String id = "";
  String title = "";
  String description = "";
  String price = "";
  String discountPercentage = "";
  String rating = "";
  String stock = "";
  String brand = "";
  String category = "";
  String thumbnail = "";
  List<String> images = [];
  Product();
  Product.addData({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.images,
  });
  Product.fromJosn(Map<String, dynamic> josn) {
    if (josn["id"] is String || josn["id"] is int) {
      id = josn["id"].toString();
    }
    if (josn["title"] is String || josn["title"] is int) {
      title = josn["title"].toString();
    }
    if (josn["description"] is String || josn["description"] is int) {
      description = josn["description"].toString();
    }
    if (josn["price"] is String ||
        josn["price"] is int ||
        josn["price"] is double) {
      price = josn["price"].toString();
    }
    if (josn["discountPercentage"] is String ||
        josn["discountPercentage"] is int ||
        josn["discountPercentage"] is double) {
      discountPercentage = josn["discountPercentage"].toString();
    }

    if (josn["rating"] != null &&
        (josn["rating"] is String ||
            josn["rating"] is int ||
            josn["rating"] is double)) {
      rating = josn["rating"].toString();
    }
    if (josn["stock"] is String || josn["stock"] is int) {
      stock = josn["stock"].toString();
    }
    if (josn["brand"] is String || josn["brand"] is int) {
      brand = josn["brand"].toString();
    }
    if (josn["category"] is String || josn["category"] is int) {
      category = josn["category"].toString();
    }
    if (josn["thumbnail"] is String || josn["thumbnail"] is int) {
      thumbnail = josn["thumbnail"].toString();
    }
    if (josn["images"] is List) {
      var imagesList = josn["images"] as List;
      for (var image in imagesList) {
        images.add(image);
      }
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "brand": brand,
      "category": category,
      "thumbnail": thumbnail,
      "images": images,
    };
    return jsonData;
  }

  void display() {
    print("id: $id");
    print("title: $title");
    print("description: $description");
    print("price: price");
    print("discountPercentage: $discountPercentage");
    print("rating: $rating");
    print("stock: $stock");
    print("brand: $brand");
    print("category: $category");
    print("thumbnail: $thumbnail");
    print("images: $images");
  }
}
