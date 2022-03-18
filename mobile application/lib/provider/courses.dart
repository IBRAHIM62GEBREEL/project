import 'dart:convert';

import 'package:e_learning/provider/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Courses with ChangeNotifier {
  late List<Course> _items = [];

  List<Course> get items {
    return [..._items];
  }

  Future<void> fetchAndSetProducts() async {
    const baseUrl = 'http://3.127.31.67/api';
    var url = Uri.parse('$baseUrl/categories');
    print(url);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      print(extractedData);

      final List<Course> loadedProducts = [];
      extractedData.forEach((prodData) {
        loadedProducts.add(
          Course(
              id: prodData['id'],
              name: prodData['name'],
              imgUrl: prodData['image']),
        );
      });
      _items = loadedProducts;
      print(items);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
