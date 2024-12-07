// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final VoidCallback onPressed;

  CustomButton(
      {required this.text,
      required this.onPressed,
      this.height,
      this.width,
      this.color,
      this.borderRadius,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 60,
        width: width ?? 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
          color: color ?? Color(0xff52BF90),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
