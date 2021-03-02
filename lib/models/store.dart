import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Store with ChangeNotifier {
  static const baseUrl =
      "https://wise-food-default-rtdb.europe-west1.firebasedatabase.app";
  final String id;
  final String storeTitle;
  final String rating;
  final String imageUrl;
  final String location;
  final String number;
  final String review;
  bool isFavorite;

  Store(
      {this.id,
      this.storeTitle,
      this.rating,
      this.imageUrl,
      this.location,
      this.number,
      this.review,
      this.isFavorite = false});

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = '$baseUrl/userFav/$userId/$id.json?auth=$token';

    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );
      print('1 response.statusCode ${response.statusCode}');
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
        print('2 response.statusCode ${response.statusCode}');
      }
    } catch (error) {
      _setFavValue(oldStatus);
      print('error: ${error.toString()}');
    }
  }
}
