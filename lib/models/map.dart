import 'package:flutter/foundation.dart';


class GMap with ChangeNotifier {
  static const baseUrl =
      "https://wise-food-default-rtdb.europe-west1.firebasedatabase.app";
  final String id;
  final String storeTitle;
  final double rating;
  final String imageUrl;
  final String location;
  final String number;
  final String review;
  final String cuisine;
  final double longitude;
  final double latitude;

  bool isFavorite;
  GMap({
    this.id,
    this.storeTitle,
    this.location,
    this.number,
    this.longitude,
    this.latitude,
    this.imageUrl,
    this.rating,
    this.cuisine,
    this.isFavorite,
    this.review,
  });
}
