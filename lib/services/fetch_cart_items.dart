import 'package:advika/models/cart_item.dart';
import 'package:advika/sample_data/cart_items.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
/*
Future<List<CartItem>> fetchCartItems() async {
  var queryParameters = {
    'param1': 'one',
    'param2': 'two',
  };
  var uri = Uri.https(
      'yourdomain.com', 'advika/cart.php', queryParameters);

  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return compute(parseCartItems, response.body);
  } else {
    throw Exception('Failed to load');
  }
}
*/

//Get Sample Data
Future<List<CartItem>> fetchCartItems() async {
  final response = sampleDataCartItems;
  return compute(parseCartItems, response);
}

List<CartItem> parseCartItems(String responseBody) {
  var obsJson = json.decode(responseBody)['data'] as List;
  List<CartItem> cartItems = obsJson.map((prItem) => CartItem.fromJson(prItem)).toList();
  return cartItems;
}
