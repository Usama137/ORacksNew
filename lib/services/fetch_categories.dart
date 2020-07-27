import 'package:advika/models/category.dart';
import 'package:advika/sample_data/categories.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
/*
Future<List<CategoryItem>> fetchCategories() async {
  var queryParameters = {
    'param1': 'one',
    'param2': 'two',
  };
  var uri = Uri.https(
      'yourdomain.com', 'advika/categories.php', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return parseCategories(response.body);
    // Use the compute function to run parse in a separate isolate.
    return compute(parseCategories, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
*/

Future<List<CategoryItem>> fetchCategories() async {
  final response = sampleDataCategories;
  return compute(parseCategories, response);
}




List<CategoryItem> parseCategories(String responseBody) {
  var obsJson = json.decode(responseBody)['data'] as List;
  List<CategoryItem> categories = obsJson.map((catItem) => CategoryItem.fromJson(catItem)).toList();
  return categories;
}

