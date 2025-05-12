import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isObscure;

  const CustomField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "Please enter your $hintText";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
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
