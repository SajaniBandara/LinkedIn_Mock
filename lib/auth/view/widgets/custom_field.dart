import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText; // Add a hintText parameter
  final TextEditingController? controller; // Optional controller
  final bool isObscure; // Optional parameter to hide text

  const CustomField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Attach the controller
      obscureText: isObscure,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "Please enter your $hintText";
        }
        return null;
      }, // Correct placement of obscureText
      decoration: InputDecoration(
        hintText: hintText, // Set the hint text
        contentPadding: const EdgeInsets.all(22),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 119, 181, 1),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 119, 181, 1),
            width: 1,
          ),
        ),
      ),
    );
  }
}
