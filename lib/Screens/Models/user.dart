import 'package:flutter_restaurant_order/Shared/constants.dart';

class MyFirebaseUser {
  final String name;

  MyFirebaseUser(this.name);
}

class UserData {
  final String name;
  final String password;
  final String type;

  UserData(this.name,  this.password, this.type);
}
