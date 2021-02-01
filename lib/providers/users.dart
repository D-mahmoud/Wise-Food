import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wisefood/models/user.dart';
import '../models/HTTPException.dart';

class Users with ChangeNotifier {
  List<User> _userDB = [];

  Future<void> fetchAndSetProducts() async {
    const url =
        'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/users.json';
    try {
      final response = await http.get(url);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      final List<User> dbUsers = [];
      dbData.forEach((key, data) {
        dbUsers.add(User(
          id: key,
          name: data['name'],
          number: data['number'],
          username: data['username'],
          password: data['password'],
          image: data['image'],
        ));
      });
      _userDB = dbUsers;
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<User> addUser(User user) async {
    const url =
        'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/users.json';

    return http
        .post(url,
            body: json.encode({
              'id': user.id,
              'name': user.name,
              'number': user.number,
              'image': user.image,
              'username': user.username,
              'password': user.password,
            }))
        .then((res) {
      final newUser = User(
          name: user.name,
          number: user.number,
          image: user.image,
          username: user.username,
          password: user.password,
          id: jsonDecode(res.body)['name']);
      _userDB.add(newUser);
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> updateUser(String id, User newUser) async {
    final url =
        'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/users/$id.json';

    final userIndex = _userDB.indexWhere((user) => user.id == id);
    if (userIndex >= 0) {
      await http.patch(url,
          body: json.encode({
            'id': newUser.id,
            'name': newUser.name,
            'number': newUser.number,
            'image': newUser.image,
            'username': newUser.username,
            'password': newUser.password,
          }));
      _userDB[userIndex] = newUser;
      notifyListeners();
    }
  }

  void deleteUser(String id) {
    final url =
        'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores/$id.json';
    final existingInd = _userDB.indexWhere((element) => element.id == id);
    var existing = _userDB[existingInd];
    _userDB.removeAt(existingInd);
    http.delete(url).then((res) {
      if (res.statusCode >= 400) {
        _userDB.insert(existingInd, existing);
        notifyListeners();
        print(res.statusCode);
        throw HTTPException('Delete Failid for id is $id');
      }
    });
    notifyListeners();
  }

  signup(String name, String number, String image, String username,
      String password) {
    const url =
        'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';
    http.post(url,
        body: json.encode({
          'name': name,
          'number': number,
          'username': username,
          'password': password,
          'image': image,
        }));
  }
}
