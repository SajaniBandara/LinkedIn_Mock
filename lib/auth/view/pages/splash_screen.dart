import 'package:flutter/material.dart';
import 'package:ilabs/auth/viewmodel/user_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    userProvider.loadUser().then((_) {
      if (userProvider.user != null) {
        Navigator.pushReplacementNamed(context, '/profile');
      } else {
        Navigator.pushReplacementNamed(context, '/landing');
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
