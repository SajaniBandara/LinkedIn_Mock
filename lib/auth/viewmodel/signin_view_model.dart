import 'package:flutter/material.dart';
import 'package:ilabs/auth/view/pages/home_page.dart';

import '../model/auth_service.dart';
import '../model/user_model.dart';
import 'package:provider/provider.dart';
import '../viewmodel/user_provider.dart';

class SignInViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool isLoading = false;
  String? errorMessage;

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.signIn(email, password);
      final user = await _authService.getCurrentUser();
      // Save user to provider and local storage

      if (user != null) {
        final userModel = UserModel(
          email: user.email!,
          password: password,
          fullName: 'Kalathma jayathilaka',
          bio: 'UI/UX Designer',
          profileImage: '',
          bannerImage: '',
        );

        Provider.of<UserProvider>(context, listen: false).setUser(userModel);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
