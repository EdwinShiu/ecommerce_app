class Product {
  final int price;
  final String id, title, category, image, subtitle, releaseDate;
  final List<String> description;

  Product({this.id, this.price, this.title, this.category, this.image, this.subtitle, this.releaseDate, this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    var descriptionList = json["description"];
    List<String> descriptionListInString = List<String>.from(descriptionList);
    return Product(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"],
      releaseDate: json["releaseDate"],
      category: json["category"],
      subtitle: json["subtitle"],
      description: descriptionListInString,
    );
  }
}
  
// Demo Product
Product product = Product(
  id: "WM1Z",
  price: 24980,
  title: "WM1Z Walkman",
  releaseDate: "20202020",
  image: "assets/images/WM1A_walkman.jpg",
  category: "MP3 Player",
  subtitle: "NW-WM1Z",
  description: [
    "High-Resolution Audio compatible",
    "DSD Native up to 11.2 MHz",
    "256GB built-in memory",
    "4.4mm Balanced Standard Plug"
  ]
);