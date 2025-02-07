import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

SnackBar buildCustomSnackBar({
  required String message,
  Duration duration = const Duration(seconds: 2),
}) {
  return SnackBar(
    content: Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.black,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    backgroundColor: ApiColors.primaryColor,
    duration: duration,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
  );
}