class Category {
  final String id, title, image;

  Category({this.id, this.title, this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}

// Demo category
Category category = Category(
  id: "001",
  title: "MP3 Player",
  image: "assets/images/MP3Player_01.png",
);