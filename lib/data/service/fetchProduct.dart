import 'dart:convert';
import '../product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProduct() async {
  const String apiUrl = "https://edwinshiu.github.io/json/ecommerce_app_api.json";
  final response = await http.get(apiUrl);
  if (response.statusCode == 200) {
    List<Product> products = (json.decode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    return products;
  } 
  else {
    throw Exception('Failed to load');
  }
}