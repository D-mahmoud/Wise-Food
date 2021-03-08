import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wisefood/models/map.dart';
import 'auth.dart';

class MapsProv with ChangeNotifier {
  static const baseUrl =
      'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app';

  List<GMap> _mapDB = [];
  String authToken;
  String userId;

  MapsProv(this.authToken, this.userId, this._mapDB);

  List<GMap> get items {
    return [..._mapDB];
  }

  GMap findById(String id) {
    return _mapDB.firstWhere((store) => store.id == id);
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

      final loadedMaps = <GMap>[];
      dbData.forEach((storeId, data) {
        print('Stores receiveToken, store: $storeId');
        loadedMaps.add(GMap(
          id: storeId,
          storeTitle: data['storeTitle'],
          rating: data['rating'],
          location: data['location'],
          number: data['number'],
          cuisine: data['cuisine'],
          longitude: data['Lng'],
          latitude: data['Ltd'],
          isFavorite:
              favoriteData == null ? false : favoriteData[storeId] ?? false,
          imageUrl: data['image'],
        ));
      });
      _mapDB = loadedMaps;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void receiveToken(Auth auth, List<GMap> items) {
    authToken = auth.token;
    userId = auth.userId;

    _mapDB = items;
  }
}
