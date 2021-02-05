import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wisefood/models/store.dart';
import 'auth.dart';

class Stores with ChangeNotifier {
  static const baseUrl =
      "https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/";
  List<Store> _storeDB = [];
  String authToken;
  String userId;

  Stores(this.authToken, this.userId, this._storeDB);
  List<Store> get items {
    return [..._storeDB];
  }

  List<Store> get favoriteItems {
    return _storeDB.where((storeTitle) => storeTitle.isFavorite).toList();
  }

  Store findById(int id) {
    return _storeDB.firstWhere((storeTitle) => storeTitle.id == id);
  }

  Future<void> fetchAndSetStores() async {
    const url =
        'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';
    try {
      final response = await http.get(url);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      final List<Store> dbStores = [];
      dbData.forEach((key, data) {
        dbStores.add(Store(
          storeTitle: data['storeTitle'],
          rating: data['rating'],
          location: data['location'],
          number: data['number'],
          image: data['image'],
        ));
      });
      _storeDB = dbStores;
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<Store> addUser(Store store) async {
    const url =
        'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';

    return http
        .post(url,
            body: json.encode({
              'storeTitle': store.storeTitle,
              'rating': store.rating,
              'location': store.location,
              'number': store.number,
              'image': store.image,
            }))
        .then((res) {
      final newStore = Store(
        storeTitle: store.storeTitle,
        rating: store.rating,
        location: store.image,
        number: store.number,
        image: store.image,
      );

      _storeDB.add(newStore);
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

  void receiveToken(Auth auth, List<Store> items) {
    authToken = auth.token;
    userId = auth.userId;
    print('Products receiveToken, userId: $userId');
    _storeDB = items;
  }
}
