import 'dart:convert';

import 'package:api_integration/view/model/product_modal.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModal>> getProductes() async {
  final response =
      await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));

  try {
    if (response.statusCode == 200) {
      final decodeedData = jsonDecode(response.body) as List;

      print("500000000");

      final result = decodeedData.map((e) => ProductModal.fromJson(e)).toList();

      return result;
    } else {
      throw Exception('Failed to load Productes');
    }
  } catch (e) {
    throw Exception(e);
  }
}
