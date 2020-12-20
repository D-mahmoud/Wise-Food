import 'dart:convert';

import 'package:http/http.dart' as http;

class Store {
  String storeTitle;
  double rating;
  String image;
  String location;
  String number;
  String review;

  Store(
      {this.storeTitle,
      this.rating,
      this.image,
      this.location,
      this.number,
      this.review});
}

class StoreData {
  int storyLevel = 0;
  List<Store> _storeDB = [
    Store(
      //0
      storeTitle: 'Gringos Burrito Grill',
      rating: 1.0,
      image: 'images/Gringos.jpg',
      location: 'Zamalek',
      number: '19734',
      review: 'Good restaurant',
    ),
    Store(
        //1
        storeTitle: 'Mezcal',
        rating: 5,
        image: 'images/mezcal.png',
        location: 'Zamalek',
        number: '19742',
        review: 'Good restaurant'),
    Store(
        //2
        storeTitle: 'Tacos Mexican Food',
        rating: 4,
        image: 'images/tacos.jpg',
        location: 'Maadi',
        number: '19792',
        review: 'Good restaurant'),
    Store(
        //3
        storeTitle: 'El Chico',
        rating: 5,
        image: 'images/elchico.jpeg',
        location: 'Nasr City',
        number: '19233',
        review: 'Good restaurant'),
    Store(
        //4
        storeTitle: 'CaiRoma',
        rating: 1,
        image: 'images/cairoma.jpg',
        location: 'Nasr City',
        number: '19242',
        review: 'Good restaurant'),
    Store(
        //5
        storeTitle: 'Osmanly Restaurant',
        rating: 2,
        image: 'images/osmanly.jpeg',
        location: 'Abdeen',
        number: '19432',
        review: 'Good restaurant'),
  ];

  List getData(int level) {
    return [
      _storeDB[level].storeTitle,
      _storeDB[level].rating,
      _storeDB[level].image,
      _storeDB[level].location,
      _storeDB[level].number,
      _storeDB[level].review
    ];
  }

  void addStore(Store store) {
    const url =
        'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';
    http.post(url,
        body: json.encode({
          'location': store.location,
          'number': store.number,
          'rating': store.rating,
          'review': store.review,
          'storeTitle': store.storeTitle,
        }));

    final newStore = Store(
        image: store.image,
        location: store.location,
        number: store.number,
        rating: store.rating,
        review: store.review,
        storeTitle: store.storeTitle);
    _storeDB.add(newStore);
    
  }
}
