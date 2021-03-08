import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wisefood/models/store.dart';
import 'auth.dart';

class Stores with ChangeNotifier {
  Stores(this.authToken, this.userId, this._storeDB);
  static const baseUrl =
      'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app';

  List<Store> _storeDB = [];
  String authToken;
  String userId;

  List<Store> get items {
    return [..._storeDB];
  }

  List<Store> get favoriteItems {
    return _storeDB.where((storeTitle) => storeTitle.isFavorite).toList();
  }

  Store findById(String id) {
    return _storeDB.firstWhere((store) => store.id == id);
  }

  List<Store> returnAll() {
    return _storeDB;
  }

  Future<void> fetchAndSetStores({bool filterByUser = false}) async {
    final filterString =
        filterByUser ? 'orderBy="ownerId"&equalTo="$userId"' : '';

    var url = '$baseUrl/stores.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(url);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      if (dbData == null) {
        return;
      }
      url = '$baseUrl/userFav/$userId.json?auth=$authToken';
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);

      final loadedStores = <Store>[];
      dbData.forEach((storeId, data) {
        print('Stores receiveToken, store: $storeId');
        loadedStores.add(Store(
          id: storeId,
          storeTitle: data['storeTitle'],
          rating: data['rating'],
          location: data['location'],
          number: data['number'],
          cuisine: data['cuisine'],
          longitude: data['Lng'],
          latitude: data['Ltd'],
          imageUrl: data['imageUrl'],
          isFavorite:
              favoriteData == null ? false : favoriteData[storeId] ?? false,
        ));
      });
      _storeDB = loadedStores;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteStore(String id) async {
    final url = '$baseUrl/stores/$id.json?auth=$authToken';
    final existingProductIndex = _storeDB.indexWhere((store) => store.id == id);

    var existingProduct = _storeDB[existingProductIndex]; //optimistic update
    _storeDB.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _storeDB.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }

  Future<void> addStore(Store store) async {
    final url = '$baseUrl/stores.json?auth=$authToken';

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'storeTitle': store.storeTitle,
          'rating': store.rating,
          'location': store.location,
          'number': store.number,
          'cuisine': store.cuisine,
          'imageUrl': store.imageUrl,
          'Lng': store.longitude,
          'Ltd': store.latitude,
         
        }),
      );

      final newStore = Store(
          storeTitle: store.storeTitle,
          rating: store.rating,
          location: store.location,
          number: store.number,
          imageUrl: store.imageUrl,
          id: json.decode(response.body)['name']);

      _storeDB.add(newStore);
      notifyListeners();
    }
    //).catchError
    catch (error) {
      print(error);
      throw error;
    }
    //);
  }

  Future<void> updateStore(String id, Store newStore) async {
    final url = '$baseUrl/stores/$id.json?auth=$authToken';

    final storeIndex = _storeDB.indexWhere((store) => store.id == id);
    if (storeIndex >= 0) {
      await http.patch(url,
          body: json.encode({
            'id': newStore.id,
            'storeTitle': newStore.storeTitle,
            'rating': newStore.rating,
            'location': newStore.location,
            'number': newStore.number,
            'cuisine': newStore.cuisine,
            'Lng': newStore.longitude,
            'Lat': newStore.latitude,
            'imageUrl': newStore.imageUrl,
            'Ltd': newStore.latitude,

           
          }));
      _storeDB[storeIndex] = newStore;
      notifyListeners();
    }
   
  }

  void receiveToken(Auth auth, List<Store> items) {
    authToken = auth.token;
    userId = auth.userId;

    _storeDB = items;
    print(authToken);
  }
}
