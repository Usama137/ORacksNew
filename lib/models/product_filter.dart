import 'package:advika/models/product.dart';

class ProductFilter {
  List<Product> products;
  ProductFilter({this.products});
  List<Product> filter(
      {String color = "any",
      String brand = "any",
      String size = "any",
      double price = 0.0}) {
    List<Product> filteredProducts = [];
    filteredProducts.forEach((prodItem) {});
    return products;
  }
}
