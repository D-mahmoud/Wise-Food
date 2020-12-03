import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Store {
  String storeTitle;
  String rating;
  String image;
  String location;
  String number;
  Store({this.storeTitle, this.rating, this.image, this.location, this.number});
}

class StoreData {   

  int storyLevel = 0;
  List<Store> storeDB = [

    Store(
          
        //0
        storeTitle: 'Gringos Burrito Grill',
        rating: '3',
        image: 'images/Gringos.jpg',
        location: 'Zamalek',
        number: '19734',
          )   ,

    Store(
        //1
        storeTitle: 'Mezcal',
        rating: '5',
        image: 'images/mezcal.png',
        location: 'Zamalek',
        number: '19742'),
    Store(
        //2
        storeTitle: 'Tacos Mexican Food',
        rating: '4',
        image: 'images/tacos.jpg',
        location: 'Maadi',
        number: '19792'),
    Store(
        //3
        storeTitle: 'El Chico',
        rating: "5",
        image: 'images/elchico.jpeg',
        location: 'Nasr City',
        number: '19233'),
    Store(
        //4
        storeTitle: 'CaiRoma',
        rating: "4",
        image: 'images/cairoma.jpg',
        location: 'Nasr City',
        number: '19242'),
    Store(
        //5
        storeTitle: 'Osmanly Restaurant',
        rating: "4",
        image: 'images/osmanly.jpeg',
        location: 'Abdeen',
        number: '19432'),
  ];

  List getData(int level) {
    return [
      storeDB[level].storeTitle,
      storeDB[level].rating,
      storeDB[level].image,
      storeDB[level].location,
      storeDB[level].number
    ];
  }
}

