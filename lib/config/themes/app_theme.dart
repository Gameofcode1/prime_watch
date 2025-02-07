import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';



ThemeData lightTheme() {
  return ThemeData(
    primaryColor: ApiColors.primaryColor,
    hintColor: Colors.black.withOpacity(0.8),
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white, // Matches light theme
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      contentTextStyle: TextStyle(color: Colors.black87),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: ApiColors.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    hintColor: Colors.white.withOpacity(0.8),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF222222), // Dark gray to match dark theme
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      contentTextStyle: TextStyle(color: Colors.white70),
    ),
  );
}