import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const Button({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(400, 50),
          backgroundColor: const Color.fromRGBO(0, 119, 181, 1),
        ),
        child: Text(buttonText,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white)) // Text
        );
  }
}
