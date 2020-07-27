import 'package:advika/models/product.dart';
import 'package:advika/sample_data/best_seller.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
/*
Future<List<Product>> fetchBestSellerProducts() async {

   var queryParameters = {
    'param1': 'one',
    'param2': 'two',
  };
  var uri = Uri.https(
      'yourdomain.com', 'advika/best-seller.php', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return parseCategories(response.body);
    // Use the compute function to run parse in a separate isolate.
    return compute(parseProducts, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
*/

//Get Sample Data
Future<List<Product>> fetchBestSellerProducts() async {
  final response = sampleDataBestSeller;
  return compute(parseProducts, response);
}

List<Product> parseProducts(String responseBody) {
  var obsJson = json.decode(responseBody)['data'] as List;
  List<Product> products = obsJson.map((prItem) => Product.fromJson(prItem)).toList();
  return products;
}
