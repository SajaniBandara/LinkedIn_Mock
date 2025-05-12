import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ilabs/auth/view/pages/landing_page.dart';
import 'package:ilabs/auth/view/pages/splash_screen.dart';
import 'package:ilabs/auth/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'auth/view/pages/signup_page.dart';
import 'auth/view/pages/signin_page.dart';
import 'auth/view/pages/profile_page.dart';
import 'auth/viewmodel/user_provider.dart';
import 'auth/viewmodel/signup_view_model.dart';
import 'auth/viewmodel/signin_view_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider(create: (_) => SignInViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilabs',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      routes: {
        '/landing': (context) => LandingPage(),
        '/signin': (context) => SigninPage(),
        '/signup': (context) => SignUpPage(),
        '/profile': (context) => const ProfilePage(),
        '/splash': (context) => const SplashScreen(),
      },
    );
  }
}
