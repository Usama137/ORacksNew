import 'package:advika/models/product.dart';
import 'package:advika/models/product_color.dart';
import 'package:advika/models/product_size.dart';

class CartItem extends Product {
  ProductColor productColor;
  ProductSize productSize;

  CartItem(
      {this.productColor,
      this.productSize,
      id,
      title,
      thumbUrl,
      price,
      brand,
      descTitle,
      descText,
      modelCode,
      rating})
      : super(
            id: id,
            title: title,
            thumbUrl: thumbUrl,
            price: price,
            brand: brand,
            descTitle: descTitle,
            descText: descText,
            modelCode: modelCode,
            rating: rating);

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      thumbUrl: json['image_path'],
      price: json['price'],
      brand: json['brand'],
      descTitle: json['desc_title'],
      descText: json['desc_text'],
      modelCode: json['model_code'],
      rating: json['rating'],
      //productColor: json['product_color'],
      //productSize: json['product_size']
    );
  }
}
