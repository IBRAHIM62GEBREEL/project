import 'dart:convert';

import 'package:e_learning/provider/lecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Lectures with ChangeNotifier {
  late List<Lecture> _items = [];

  List<Lecture> get items {
    return [..._items];
  }

  Future<void> fetchAndSetProducts(dynamic id) async {
    var url = Uri.parse('http://3.127.31.67/api/category/${id.toString()}');
    print(url);
    // try {
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    //   if (extractedData == null) {
    //     return;
    //   }
    //   url =
    //       'https://flutter-update.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
    //   final favoriteResponse = await http.get(url);
    //   final favoriteData = json.decode(favoriteResponse.body);
    final List<Lecture> loadedProducts = [];
    extractedData.forEach((prodData) {
      loadedProducts.add(Lecture(
          id: prodData['id'],
          name: prodData['name'],
          level: prodData['level'],
          category: prodData['category']));
    });
    _items = loadedProducts;
    print(items);
    notifyListeners();
    // } catch (error) {
    //   rethrow;
    // }
  }
}
