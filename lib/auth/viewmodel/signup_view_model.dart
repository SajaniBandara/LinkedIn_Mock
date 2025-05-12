import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/auth_service.dart';
import '../model/user_model.dart';
import '../viewmodel/user_provider.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool isLoading = false;
  String? errorMessage;

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final user = await _authService.signUp(email, password);
      if (user != null) {
        final userModel = UserModel(
          email: user.email!,
          password: password,
          fullName: 'Default Name',
          bio: 'Default Bio',
          profileImage: '',
          bannerImage: '',
        );

        // Save user to provider and local storage
        Provider.of<UserProvider>(context, listen: false).setUser(userModel);

        Navigator.pushReplacementNamed(context, '/signin');
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
