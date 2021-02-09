import 'package:flutter/foundation.dart';

class Store with ChangeNotifier {
  final int id;
  final String storeTitle;
  final double rating;
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

class StoreData {
  int storyLevel = 0;
  List<Store> _storeDB = [
    Store(
      //0
      storeTitle: 'Gringos Burrito Grill',
      rating: 1.0,
      imageUrl: 'images/Gringos.jpg',
      location: 'Zamalek',
      number: '19734',
      review: 'Good restaurant',
    ),
    Store(
        //1
        storeTitle: 'Mezcal',
        rating: 5,
        imageUrl: 'images/mezcal.png',
        location: 'Zamalek',
        number: '19742',
        review: 'Good restaurant'),
    Store(
        //2
        storeTitle: 'Tacos Mexican Food',
        rating: 4,
        imageUrl: 'images/tacos.jpg',
        location: 'Maadi',
        number: '19792',
        review: 'Good restaurant'),
    Store(
        //3
        storeTitle: 'El Chico',
        rating: 5,
        imageUrl: 'images/elchico.jpeg',
        location: 'Nasr City',
        number: '19233',
        review: 'Good restaurant'),
    Store(
        //4
        storeTitle: 'CaiRoma',
        rating: 1,
        imageUrl: 'images/cairoma.jpg',
        location: 'Nasr City',
        number: '19242',
        review: 'Good restaurant'),
    Store(
        //5
        storeTitle: 'Osmanly Restaurant',
        rating: 2,
        imageUrl: 'images/osmanly.jpeg',
        location: 'Abdeen',
        number: '19432',
        review: 'Good restaurant'),
  ];

  List getData(int level) {
    return [
      _storeDB[level].storeTitle,
      _storeDB[level].rating,
      _storeDB[level].imageUrl,
      _storeDB[level].location,
      _storeDB[level].number,
      _storeDB[level].review
    ];
  }
}
