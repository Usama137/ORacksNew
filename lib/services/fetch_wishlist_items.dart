import 'package:advika/models/product.dart';
import 'package:advika/sample_data/wishlist_items.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
/*
Future<List<Product>> fetchWishListItems() async {
  var queryParameters = {
    'param1': 'one',
    'param2': 'two',
  };
  var uri = Uri.https(
      'yourdomain.com', 'advika/wishlist.php', queryParameters);
  if (response.statusCode == 200) {
    return compute(parseWishListItems, response.body);
  } else {
    throw Exception('Failed to load');
  }
}
*/

Future<List<Product>> fetchWishListItems() async {
  final response = sampleDataWishList;
  return compute(parseWishListItems, response);
}

List<Product> parseWishListItems(String responseBody) {
  var obsJson = json.decode(responseBody)['data'] as List;
  List<Product> wishListItems =
      obsJson.map((prItem) => Product.fromJson(prItem)).toList();
  return wishListItems;
}
