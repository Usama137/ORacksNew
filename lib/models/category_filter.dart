class CategoryFilterItem{
  final int id;
  String title;
  bool active;
  CategoryFilterItem({this.id, this.title, this.active=false});

  factory CategoryFilterItem.fromJson(Map<String, dynamic> json) {
    return CategoryFilterItem(
      id: json['id'],
      title: json['title'],
    );
  }
}