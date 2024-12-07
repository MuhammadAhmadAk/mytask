// lib/widgets/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool obscureText;
  CustomTextField(
      {required this.controller,
      required this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(27),
                borderSide: BorderSide(color: Colors.black12)),
            enabledBorder: OutlineInputBorder(
                gapPadding: 20,
                borderRadius: BorderRadius.circular(27),
                borderSide: BorderSide(color: Colors.black12))),
      ),
    );
  }
}
