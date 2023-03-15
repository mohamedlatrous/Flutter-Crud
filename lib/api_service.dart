import 'dart:convert';

import 'package:rest/products.dart';
import 'package:http/http.dart';

class ApiService {
  final Uri apiUrl = Uri.parse('http://127.0.0.1:8000/products');
  Future<List<Products>> getProducts() async {
    Response res = await get(apiUrl);
    
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Products> products =
          body.map((dynamic item) => Products.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Error');
    }
  }

  Future<Products> getProductById(String id) async {
    final response = await get(Uri.parse('http://127.0.0.1:8000/products/$id'));

    if (response.statusCode == 200) {
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

  Future<Products> addProduct(Products product) async {
    Map data = {
      'name': product.name,
      'description': product.description,
      'price': product.price,
      'qty': product.qty,
      'updated': DateTime.now().toString().substring(0, 10)
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur');
    }
  }

  Future<Products> updateProduct(String id, Products Product) async {
    Map data = {
      'name': Product.name,
      'description': Product.description,
      'price': Product.price,
      'qty': Product.qty,
      'updated': DateTime.now().toString().substring(0, 10)
    };

    final Response response = await put(
     // '$apiUrl/$id' as Uri,
     Uri.parse('http://127.0.0.1:8000/products/$id'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur');
    }
  }

  Future<void> deleteProduct(String id) async {
    Response res = await delete(Uri.parse('http://127.0.0.1:8000/products/$id'));

    if (res.statusCode == 200) {
      print("Success");
    } else {
      throw "Erreur";
    }
  }
}
