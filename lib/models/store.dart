import 'package:flutter/foundation.dart';

class Store with ChangeNotifier {
  final int id;
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

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
