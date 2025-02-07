import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;  // Add onPressed callback

  const AppButton({
    super.key,
    required this.text,
    required this.color,
    this.onPressed,  // Make it optional
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () => Navigator.pop(context),  // Use provided callback or default
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}