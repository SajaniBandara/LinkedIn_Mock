import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../model/local_storage_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final LocalStorageService _localStorageService = LocalStorageService();

  UserModel? get user => _user;

  Future<void> loadUser() async {
    _user = await _localStorageService.getUser();
    notifyListeners();
  }

  Future<void> setUser(UserModel user) async {
    _user = user;
    await _localStorageService.saveUser(user);
    notifyListeners();
  }

  Future<void> clearUser() async {
    _user = null;
    await _localStorageService.clearUser();
    notifyListeners();
  }
}
