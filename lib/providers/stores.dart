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

  // Stores(this.authToken, this.userId, this._storeDB);
  List<Store> get items {
    return [..._storeDB];
  }

  List<Store> get favoriteItems {
    return _storeDB.where((storeTitle) => storeTitle.isFavorite).toList();
  }

  Store findById(int id) {
    return _storeDB.firstWhere((storeTitle) => storeTitle.id == id);
  }

  Future<void> fetchAndSetStores({bool filterByUser = false}) async {
    final filterString =
        filterByUser ? 'orderBy="ownerId"&equalTo="$userId"' : '';

    var url = '$baseUrl/stores.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      url = '$baseUrl/userFav/$userId.json?auth=$authToken';
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Store> loadedProducts = [];
      extractedData.forEach((storeId, data) {
        loadedProducts.add(Store(
          storeTitle: data['storeTitle'],
          rating: data['rating'],
          location: data['location'],
          number: data['number'],
          image: data['image'],
          isFavorite:
              favoriteData == null ? false : favoriteData[storeId] ?? false,
        ));
      });
      _storeDB = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  // Future<void> fetchAndSetStores() async {
  //   const url =
  //       'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';
  //   try {
  //     final response = await http.get(url);
  //     final dbData = json.decode(response.body) as Map<String, dynamic>;
  //     final List<Store> dbStores = [];
  //     dbData.forEach((key, data) {
  //       dbStores.add(Store(
  //         storeTitle: data['storeTitle'],
  //         rating: data['rating'],
  //         location: data['location'],
  //         number: data['number'],
  //         image: data['image'],
  //       ));
  //     });
  //     _storeDB = dbStores;
  //     notifyListeners();
  //   } on Exception catch (e) {
  //     print(e.toString());
  //     throw (e);
  //   }
  // }

  Future<void> addStore(Store store) async {
   // final url = '$baseUrl/stores.json?auth=$authToken';
      //  final url=' https://test-22160-default-rtdb.firebaseio.com/users.json';
      const url='https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/users.json';

    return http
        .post(url,
            body: json.encode({
              'storeTitle': store.storeTitle,
             // 'rating': store.rating,
              'location': store.location,
              'number': store.number,
              //'image': store.image,
            }))
        .then((res) {
      final newStore = Store(
        storeTitle: store.storeTitle,
       // rating: store.rating,
        location: store.image,
        number: store.number,
       // image: store.image,
         id: jsonDecode(res.body)['name']);

      _storeDB.add(newStore);
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> updateStore(int id, Store newStore) async {
    final url =
        'https://csc422-rldb-default-rtdb.firebaseio.com/products/$id.json';

    final storeIndex = _storeDB.indexWhere((store) => store.id == id);
    if (storeIndex >= 0) {
      await http.patch(url,
          body: json.encode({
            'id': newStore.id,
            'storeTitle': newStore.storeTitle,
            'rating': newStore.rating,
            'location': newStore.location,
            'number': newStore.number,
            'image': newStore.image,
          }));
      _storeDB[storeIndex] = newStore;
      notifyListeners();
    }
  }

  void receiveToken(Auth auth, List<Store> items) {
    authToken = auth.token;
    userId = auth.userId;
    print('Products receiveToken, userId: $userId');
    _storeDB = items;
  }
}
