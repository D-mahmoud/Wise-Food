import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String id;
  String name;
  double number;
  String image;
  String username;
  String password;

  User(
      {this.id,
      this.name,
      this.number,
      this.image,
      this.username,
      this.password});
}
