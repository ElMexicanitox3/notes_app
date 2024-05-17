import 'package:flutter/material.dart';

class AppThemes{

  // Static colors scheme

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    cardTheme: CardTheme(color: Colors.white),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    cardTheme: CardTheme(color: Colors.black),
    useMaterial3: true,
  );

}