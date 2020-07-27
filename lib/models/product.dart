class Product {
  int id;
  String title;
  String thumbUrl;
  double price;
  String brand;
  String descTitle;
  String descText;
  String modelCode;
  double rating;
  bool isDiscauntActive = true;
  double discauntValue = 0.0;

  int quantity;
  Product(
      {this.id,
      this.title,
      this.thumbUrl,
      this.price,
      this.brand,
      this.descTitle,
      this.descText,
      this.modelCode,
      this.rating});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        thumbUrl: json['image_path'],
        price: json['price'],
        brand: json['brand'],
        descTitle: json['desc_title'],
        descText: json['desc_text'],
        modelCode: json['model_code'],
        rating: json['rating']);
  }
}
