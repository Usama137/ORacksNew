import 'package:advika/models/category_filter.dart';
import 'package:advika/sample_data/category_filter_items.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
/*
Future<List<CategoryFilterItem>> fetchCategoryFilterItems() async {
  final response =
  await http.get('https://yourdomain.ru/advika/category_filter_items.php');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return parseCategories(response.body);
    // Use the compute function to run parse in a separate isolate.
    return compute(parseCategoryFilterItems, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
*/

//Get Sample Data
Future<List<CategoryFilterItem>> fetchCategoryFilterItems() async {
  final response = sampleDataCategoryFilterItems;
  return compute(parseCategoryFilterItems, response);
}


List<CategoryFilterItem> parseCategoryFilterItems(String responseBody) {
  var obsJson = json.decode(responseBody)['data'] as List;
  List<CategoryFilterItem> categoryFilterItems = obsJson.map((catItem) => CategoryFilterItem.fromJson(catItem)).toList();
  return categoryFilterItems;
}
