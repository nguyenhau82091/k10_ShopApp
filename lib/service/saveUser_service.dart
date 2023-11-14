import 'package:k10_shopapp/model/user_Model.dart';

class UserManager {
  static final UserManager _singleton = UserManager._internal();

  factory UserManager() {
    return _singleton;
  }

  UserManager._internal();

  User? _user;

  void setUser(User user) {
    _user = user;
  }

  User? getUser() {
    return _user;
  }
}