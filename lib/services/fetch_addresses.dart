import 'package:advika/models/shipping_to.dart';
import 'package:advika/sample_data/addresses.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
/*
Future<List<ShippingTo>> fetchAddresses() async {

   var queryParameters = {
    'param1': 'one',
    'param2': 'two',
  };
  var uri = Uri.https(
      'yourdomain.com', 'advika/addresses.php', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return parseCategories(response.body);
    // Use the compute function to run parse in a separate isolate.
    return compute(parseAddresses, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
*/

Future<List<ShippingTo>> fetchAddresses() async {
  final response = sampleDataAddresses;
  return compute(parseAddresses, response);
}

List<ShippingTo> parseAddresses(String responseBody) {
  var obsJson = json.decode(responseBody)['data'] as List;
  List<ShippingTo> addresses =
      obsJson.map((adrItem) => ShippingTo.fromJson(adrItem)).toList();
  return addresses;
}
