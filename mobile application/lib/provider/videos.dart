import 'dart:convert';

import 'package:e_learning/provider/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Videos with ChangeNotifier {
  late List<Video> _items = [];

  List<Video> get items {
    return [..._items];
  }

  Future<void> fetchAndSetProducts(dynamic id) async {
    var url = Uri.parse('http://3.127.31.67/api/lecture/${id.toString()}');
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
    final List<Video> loadedProducts = [];
    extractedData.forEach((prodData) {
      loadedProducts.add(Video(
          id: prodData['id'],
          imgUrl: prodData['image_url'],
          index: prodData['index'],
          lecture: prodData['lecture'],
          text: prodData['text'],
          videoUrl: prodData['video_url']));
    });
    _items = loadedProducts;
    print(items);
    notifyListeners();
    // } catch (error) {
    //   rethrow;
    // }
  }
}
