import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/signup_view_model.dart';
import '../widgets/custom_field.dart';
import '../widgets/button.dart';

class SignUpPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<SignUpViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
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
                if (signUpViewModel.isLoading)
                  const CircularProgressIndicator()
                else
                  Button(
                    buttonText: "Sign Up",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        signUpViewModel.signUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          context,
                        );
                      }
                    },
                  ),
                const SizedBox(height: 20),
                if (signUpViewModel.errorMessage != null)
                  Text(
                    signUpViewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 119, 181, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signin');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
