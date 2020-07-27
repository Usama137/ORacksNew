class CategoryItem {
  final int id;
  final String title;
  final String imagePath;
  int itemsInCategory = 5320;
  CategoryItem({this.id, this.title, this.imagePath});

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      title: json['title'],
      imagePath: json['image_path'],
    );
  }
}
