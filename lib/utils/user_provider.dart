import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pheobe/utils/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future setUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _user = user;
    prefs.setString("userInfo", jsonEncode(user.toJson()));
    notifyListeners();
  }

  Future<void> loadUserFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString("userInfo");
    if (userData != null) {
      _user = UserModel.fromJson(jsonDecode(userData));
      notifyListeners();
    }
  }

  void clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _user = null;
    prefs.remove("userInfo");
    notifyListeners();
  }
}
