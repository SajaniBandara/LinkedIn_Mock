import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/signin_view_model.dart';
import '../widgets/custom_field.dart';
import '../widgets/button.dart';

class SigninPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signInViewModel = Provider.of<SignInViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 119, 181, 1),
                ),
              ),
              const SizedBox(height: 20),
              CustomField(
                hintText: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 10),
              CustomField(
                hintText: "Password",
                controller: passwordController,
                isObscure: true,
              ),
              const SizedBox(height: 20),
              if (signInViewModel.isLoading)
                const CircularProgressIndicator()
              else
                Button(
                  buttonText: "Sign In",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      signInViewModel.signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        context,
                      );
                    }
                  },
                ),
              if (signInViewModel.errorMessage != null)
                Text(
                  signInViewModel.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 119, 181, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/signup');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
