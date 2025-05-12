import 'dart:convert';
import 'package:ilabs/auth/viewmodel/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LocalStorageService {
  static const String _userKey = 'user';

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}

final localStorageService = LocalStorageService();
void initializeUser(BuildContext context) async {
  final user = await localStorageService.getUser();
  if (user != null) {
    Provider.of<UserProvider>(context, listen: false).setUser(user);
  } else {
    Navigator.pushReplacementNamed(context, '/signin');
  }
}
