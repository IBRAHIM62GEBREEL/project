import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  var headers = {'Content-Type': 'application/json'};

  String? _token;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    return _token;
  }

  Future<void> signup(
      {required String email,
      required String password,
      required String userName,
      required String name}) async {
    final url = Uri.parse('http://3.127.31.67/api/register');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'email': email,
            'username': userName,
            'password': password,
            'name': name,
          },
        ),
      );

      final responseData = json.decode(response.body);
      _token = responseData['token'];
      print(responseData);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> login(String userName, String password) async {
    final url = Uri.parse('http://3.127.31.67/api/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'username': userName,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);
      print(responseData);
      _token = responseData['token'];

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
